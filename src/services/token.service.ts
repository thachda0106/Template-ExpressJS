const { DatabaseService } = require("@services/database.service")

class TokenService {
  private db;
  constructor()  {
    this.db = DatabaseService.db;
  }

  async createToken() {
  }

  
  async refreshToken() {
  }
}

export {
  TokenService
}