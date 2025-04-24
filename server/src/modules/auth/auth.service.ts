import {
  Injectable,
  UnauthorizedException,
  ConflictException,
} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UsersService } from '../users/users.service';
import * as bcrypt from 'bcrypt';

@Injectable()
export class AuthService {
  constructor(
    private usersService: UsersService,
    private jwtService: JwtService,
  ) {}

  async register(email: string, password: string, username: string, dateOfBirth?: Date) {
    const user = await this.usersService.create(email, password, username, dateOfBirth);
    return {
      message: 'Đăng ký thành công',
      userId: user.id,
    };
  }

  async login(email: string, password: string) {
    const user = await this.usersService.findByEmail(email);
    if (!user) throw new UnauthorizedException('Thông tin đăng nhập không chính xác');

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) throw new UnauthorizedException('Thông tin đăng nhập không chính xác');

    const payload = { sub: user.id, email: user.email };
    const token = this.jwtService.sign(payload);

    return {
      message: 'Đăng nhập thành công',
      access_token: token,
      user: {
        id: user.id,
        email: user.email,
        username: user.username,
        dateOfBirth: user.dateOfBirth,
        createdAt: user.createdAt,
        updatedAt: user.updatedAt,
      },
    };
  }

  async updatePassword(userId: string, newPassword: string) {
    const user = await this.usersService.findById(userId);
    if (!user) throw new UnauthorizedException('Không tìm thấy người dùng');

    await this.usersService.updatePassword(userId, newPassword);
    return { message: 'Cập nhật mật khẩu thành công' };
  }
}
