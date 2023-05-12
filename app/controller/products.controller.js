import { pool } from "../config/database/db"

export const findProductos = async (req, res)=>{
    try {
        const [rows] = await pool.query("CALL spVerProductos();");
        res.json(rows);
    } catch (error) {
        console.log(error);
    }
}
export const createProductos = async (req, res)=>{
    const estado = req.body.estado;
    const nombre = req.body.nombre;
    const cantidad = req.body.cantidad;
    const precio = req.body.precio;
    const foto = req.body.foto;
    const descripcion = req.body.descripcion;
    try {
        const result = await pool.query(`CALL spCrearProductos('${name}');`);
        res.json(result);
        
    } catch (error) {
        console.error("ha ocurrido un error")
    }

}
export const deleteUser = async (req, res)=>{
    const id = req.params.id;
    try {
        const result = await pool.query(`CALL spDeleteUser(${id})`);
        if(result[0].affectedRows == 1)
            res.json(result);
        else
            res.json({"rs": "No se elimino"});
            
    } catch (error) {
        console.error(error);
    }
}
export const updateUser = async (req, res)=>{
    const id = req.body.id;
    const name = req.body.name;
    try {
        const result = await pool.query(`CALL spUpdateUser(${id}, '${name}');`)
        if(result[0].affectedRows != 0)
            res.json(result);
         else
            res.json({"rs": "NO ACTUALIZO"});

    } catch (error) {
        console.error(error);
    }
}