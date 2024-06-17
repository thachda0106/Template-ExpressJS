const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

require('module-alias/register');
require("dotenv").config();

const compression = require('compression'),
{ limiter } = require("@configs/requestLimiter.config"),
{ default: helmet } = require('helmet');

// Init DB
const { DatabaseService } = require('@services/database.service');
DatabaseService.getDb();
  
// Routers
const { indexRouter } = require("@routers");
const { authRouter } = require("@routers/auth.route");

app
.use(compression())
.use(helmet())
.use(limiter);

app
  .use('/', indexRouter)
  .use('/auth', authRouter);

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});
