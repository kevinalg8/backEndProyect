import { Router } from "express";
import * as controller from "../controller/products.controller"

const route = Router();

route.get("/", (req,res)=>{
    res.send(`<h1>Hola Mundo </h1>`);
});

route.get("/producto",controller.findProductos);

route.post("/producto",controller.createProductos);
/* 
route.get("/user/:id",controller.findUser);
route.post("/user/",controller.insertUser);
route.put("/user",controller.updateUser);
route.delete("/user/:id", controller.deleteUser);
*/

export default route;
