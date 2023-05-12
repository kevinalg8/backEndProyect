import { pool } from "../config/database/db"

export const createUsers = async (req, res)=>{
    const name = req.body.name;
    try {
        const result = await pool.query(`CALL spCreateUsers(${name})`);
        res.json(result);
    } catch (error) {
        console.log(error);
    }
}
export const findAllUsers = async (req, res)=>{
    try {
        const [rows] = await pool.query(`CALL spFindAllUsers()`);
        res.json(rows);
    } catch (error) {
        console.log(error);
    }
}
