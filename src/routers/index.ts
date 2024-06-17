import { AuthService } from "../services/auth.service";


const express = require("express");
const indexRouter = express.Router();

indexRouter.get("/", async function (req, res) {
  res.status(200).send("Welcome to e-commerce apis.");
});

export {
  indexRouter
};