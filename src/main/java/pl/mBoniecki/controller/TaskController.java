package pl.mBoniecki.controller;

import pl.mBoniecki.DTO.TaskDto;
import pl.mBoniecki.service.TaskService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/task")
public class TaskController extends HttpServlet {

    private TaskService taskService = new TaskService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String deleteId = req.getParameter("id");
        if (deleteId != null && !deleteId.isEmpty()) {
            taskService.deleteTask(Long.valueOf(deleteId));
        }

        List<TaskDto> allTasks = taskService.getAllTasks();
        req.setAttribute("task", allTasks);
        RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
        dispatcher.forward(req, resp);
        resp.sendRedirect("/task");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("task");
        String description = req.getParameter("message");

        if (name != null && !name.isEmpty() && description != null && !description.isEmpty()) {
            TaskDto taskDto = new TaskDto();
            taskDto.setName(name);
            taskDto.setDescription(description);
            taskService.addTask(taskDto);
        }
        resp.sendRedirect("/task");
    }
}