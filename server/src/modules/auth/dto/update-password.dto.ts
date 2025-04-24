import { IsString, MinLength, MaxLength } from 'class-validator';

export class UpdatePasswordDto {
    @IsString({ message: 'Mật khẩu cũ không được để trống' })
    @MinLength(6, { message: 'Mật khẩu cũ phải có ít nhất 6 ký tự' })
    @MaxLength(20, { message: 'Mật khẩu cũ không được vượt quá 20 ký tự' })
    oldPassword: string;
  
    @IsString({ message: 'Mật khẩu mới không được để trống' })
    @MinLength(6, { message: 'Mật khẩu mới phải có ít nhất 6 ký tự' })
    @MaxLength(20, { message: 'Mật khẩu mới không được vượt quá 20 ký tự' })
    newPassword: string;
  }