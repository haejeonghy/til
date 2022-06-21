import statusUtil from "../../utils/statusUtil";
import pool from "../pool";

const tableName = "user";

const user = {
  selectAll: async () => {
    const query = `SELECT * FROM ${tableName}`;
    const result = await pool.query(query);

    return result ? statusUtil.success(result) : statusUtil.false();
  },
  insert: async (name) => {
    const query = `INSERT INTO ${tableName} (name) VALUES (?, ?)`;
    const result = await pool.query(query, [name]);

    return result ? statusUtil.success(result) : statusUtil.false();
  },
};

export default user;