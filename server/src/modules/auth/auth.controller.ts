import { Controller, Post, Body, Param, UsePipes, ValidationPipe } from '@nestjs/common';
import { AuthService } from './auth.service';
import { RegisterDto } from './dto/register.dto';
import { LoginDto } from './dto/login.dto';
import { UpdatePasswordDto } from './dto/update-password.dto';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post('register')
  @UsePipes(new ValidationPipe({ transform: true, forbidNonWhitelisted: true, whitelist: true }))
  async register(@Body() registerDto: RegisterDto) {
    return this.authService.register(
      registerDto.email,
      registerDto.password,
      registerDto.username,
      registerDto.dateOfBirth,
    );
  }

  @Post('login')
  @UsePipes(new ValidationPipe({ transform: true, forbidNonWhitelisted: true, whitelist: true }))
  async login(@Body() loginDto: LoginDto) {
    return this.authService.login(loginDto.email, loginDto.password);
  }

  @Post('update-password/:userId')
  @UsePipes(new ValidationPipe({ transform: true, forbidNonWhitelisted: true, whitelist: true }))
  async updatePassword(@Param('userId') userId: string, @Body() updatePasswordDto: UpdatePasswordDto) {
    return this.authService.updatePassword(userId, updatePasswordDto.newPassword);
  }
}
