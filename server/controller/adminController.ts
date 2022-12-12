import { RequestHandler } from "express";
import asyncHandler from "express-async-handler"
import Todo, { TodoModel } from "../model/Todo";
import ErrorHandler from "../utility/errorHandler";
import User from "../model/User";

const getTodoDataAdminController: RequestHandler = asyncHandler(async(req, res, next)=>{
  
  if(!req.user){
    throw new ErrorHandler(`User has been deleted`, 400)
  }
  if(!req.user.id){
    throw new ErrorHandler(`User not found`, 404)
  }

  const todo= await Todo.findAll({ 
    order: [['createdAt', 'desc']], 
    include: [ { model: User, attributes: ['id','name', 'email'], as:'user', 
    required:true } ] 
  }) as TodoModel[]

  if(todo.length === 0){
    throw new ErrorHandler(`Data not found`, 404)
  }

  res.status(200).json({ success:true, data: todo })

});

const updateTodoAdminController: RequestHandler = asyncHandler(async(req, res, next) =>{

  const { title, content } = req.body

  if(!req.user){
    throw new ErrorHandler(`User has been deleted`, 400)
  }
  if(!req.user.id){
    throw new ErrorHandler(`User not found`, 404)
  }

  const todo= await Todo.findByPk(req.params.id) as TodoModel
  if(!todo){
    throw new ErrorHandler(`Data not found`, 404)
  }

  todo.title= title
  todo.content = content
  await todo.save()

  res.status(200).json({ success:true, data: todo })

})

const removeTodoDataAdminController: RequestHandler = asyncHandler(async(req, res, next) =>{

  if(!req.user){
    throw new ErrorHandler(`User has been deleted`, 400)
  }
  if(!req.user.id){
    throw new ErrorHandler(`User not found`, 404)
  }
  
  const todo= await Todo.findByPk(req.params.id)
  if(!todo){
    throw new ErrorHandler(`Data not found`, 404)
  }
  await todo.destroy()

  res.status(200).json({ success:true, data: todo })

})

export{
  getTodoDataAdminController,
  updateTodoAdminController,
  removeTodoDataAdminController
}