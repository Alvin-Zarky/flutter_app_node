import express from "express";
import { getTodoDataAdminController, removeTodoDataAdminController, updateTodoAdminController } from "../controller/adminController";
import {authRoleToken, authTokenMiddleware} from "../middleware/authTokenMiddleware";

const router = express.Router()
router.use(authTokenMiddleware)
router.use(authRoleToken('admin'));
router.route('/todo').get(getTodoDataAdminController)
router.route('/todo/:id').put(updateTodoAdminController).delete(removeTodoDataAdminController)

export default router