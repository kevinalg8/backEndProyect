import { Router } from "express";
import * as controller from "../controller/user.controller"

const Route = Router();

Route.get("/", (req,res)=>{
    res.send(`<h1>Hola Mundo </h1>`);
});

Route.post("/users",controller.createUsers);
Route.get("/users",controller.findAllUsers);
//Route.put("/users",controller.updateUser);

export default Route;
