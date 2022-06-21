import mysql from "promise-mysql";
import dotenv from "dotenv";

dotenv.config()

const dbConfig = {
  host: process.env.TEST_DB_HOST,
  port: process.env.TEST_DB_PORT,
  user: process.env.TEST_DB_USER,
  password: process.env.TEST_DB_PASSWORD,
  database: "spark_it",
};

export default mysql.createPool(dbConfig);