import { User } from './entities/user.entity';
import { Repository } from 'typeorm';
export declare class UsersService {
    private readonly userRepository;
    constructor(userRepository: Repository<User>);
    create(email: string, password: string, username: string): Promise<User>;
    findByEmail(email: string): Promise<User | null>;
    findById(id: string): Promise<User | null>;
}
