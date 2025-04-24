import { IsString, MinLength } from 'class-validator';

export class UpdatePasswordDto {
  @IsString()
  userId: string;

  @IsString()
  @MinLength(6)
  newPassword: string;
}