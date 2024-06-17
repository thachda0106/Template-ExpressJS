const { drizzle } = require("drizzle-orm/mysql2");
const mysql = require("mysql2/promise");
const { dbCredentials } = require("@configs/db.config.ts");
const schema = require("@drizzle/schema");

class DatabaseService {
  public static db;

  constructor() {}
  
  public static async getDb() {
    
    if (DatabaseService.db) {
      return;
    }

    try {
      const connection = await mysql.createConnection(dbCredentials);
      DatabaseService.db = drizzle(connection, { schema, mode: "default"});
      console.log("Connect successfully to DB.");
    } catch (error) {
      console.log(error);
    }
  }
}

export {
  DatabaseService
};
