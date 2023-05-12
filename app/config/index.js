import app from "../app.js";
import message from "./message";

export const caseEntorno = ()=>{
    switch (process.env.NODE_ENV) {
        case "developer":
            message(`http://localhost:${app.get("PORT")}`, "success");
            break;
        case "qa":
            message(`http://localhost:${app.get("PORT")}`, "warning");
            break;
        case "production":
            message(`http://localhost:${app.get("PORT")}`, "danger");
            break;
    
        default:
            message(`http://localhost:${app.get("PORT")}`, "white");
            break;
    }
}
