import { JwtService } from '@nestjs/jwt';
import { UsersService } from '../users/users.service';
export declare class AuthService {
    private usersService;
    private jwtService;
    constructor(usersService: UsersService, jwtService: JwtService);
    register(email: string, password: string, username: string): Promise<{
        message: string;
        userId: string;
    }>;
    login(email: string, password: string): Promise<{
        message: string;
        access_token: string;
    }>;
}
