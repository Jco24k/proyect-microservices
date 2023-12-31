import * as bcrypt from 'bcrypt';
export class PassportCrypt {
  static encrypt(pwd_to_encrypt: string): string {
    return bcrypt.hashSync(pwd_to_encrypt, 10);
  }
  static verifyPassword(pwd_to_check: string, pwd_encrypted: string): boolean {
    return bcrypt.compareSync(pwd_to_check, pwd_encrypted);
  }
}
