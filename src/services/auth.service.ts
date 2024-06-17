const { DatabaseService } = require("@services/database.service")

class AuthService {
  private db;
  constructor()  {
    this.db = DatabaseService.db;
  }

  async login() {
  }

  
  async logout() {
  }
}

export {
  AuthService
}
