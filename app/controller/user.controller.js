import { pool } from "../config/database/db"

export const createUsers = async (req, res)=>{
    const name = req.body.name;
    try {
        const result = await pool.query(`CALL spCreateUsers('${name}')`);
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
export const updateUser = async (req, res)=>{
    const id = req.body.id
    const name = req.body.name

    try {
        const result = await pool.query(`CALL spUpdateUser(${id},'${name}')`)
        if (result[0].affectedRows != 0) {
            res.json(result[0])
        } else
            res.json({ "msg": "No Actualizó" })
    } catch (error) {
        console.error(error);
    }
}
