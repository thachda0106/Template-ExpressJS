import { AuthService } from "../services/auth.service";

class AuthController {
  private authService;
  
  constructor()  {
    this.authService = new AuthService();
  }

  async login([req, res, next]) {
    this.authService.login();
    // Do somethings
    res.status(200).json(null)
  }

  
  async logout([req, res, next]) {
    this.authService.login();
  }
}

export {
  AuthController
}
