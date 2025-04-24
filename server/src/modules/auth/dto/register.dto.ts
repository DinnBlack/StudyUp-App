import { IsEmail, IsString, IsOptional, MinLength, MaxLength } from 'class-validator';

export class RegisterDto {
  @IsEmail({}, { message: 'Email không hợp lệ' })
  email: string;

  @IsString({ message: 'Mật khẩu không được để trống' })
  @MinLength(6, { message: 'Mật khẩu phải có ít nhất 6 ký tự' })
  @MaxLength(20, { message: 'Mật khẩu không được vượt quá 20 ký tự' })
  password: string;

  @IsString({ message: 'Tên người dùng không được để trống' })
  username: string;

  @IsOptional()
  dateOfBirth?: Date;
}