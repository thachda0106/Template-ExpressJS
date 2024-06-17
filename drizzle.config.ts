const { defineConfig } = require("drizzle-kit");
const { dbCredentials } = require("@configs/db.config");

export default defineConfig({
  dialect: "mysql",
  schema: "./src/drizzle/schema.ts",
  out: "./src/drizzle",
  dbCredentials,
});
