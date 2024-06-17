const RateLimit = require("express-rate-limit");

// Maximum of twenty requests per minute
const limiter = RateLimit({
  windowMs: 1 * 60 * 1000, // 1 minute
  max: 20,
});

export {
  limiter
};
