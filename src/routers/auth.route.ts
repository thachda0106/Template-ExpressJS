const express = require("express");
const authRouter = express.Router();
const { AuthController } = require("@controllers/auth.controller")

const authController = new AuthController();

authRouter.get("/login", function (...context) {
  authController.login(context);
});

authRouter.post("/logout", function (...context) {
  authController.logout(context);
});

export {
  authRouter
};
