package pl.mBoniecki.service;

import pl.mBoniecki.DAO.TaskDao;
import pl.mBoniecki.DTO.TaskDto;
import pl.mBoniecki.entity.Task;

import java.util.ArrayList;
import java.util.List;

public class TaskService {

    private TaskDao taskDao = new TaskDao();

    public List<TaskDto> getAllTasks() {
        List<Task> tasks = taskDao.findAll();
        if (tasks == null || tasks.isEmpty()) {
            return new ArrayList<>();
        }

        List<TaskDto> taskDtos = new ArrayList<>(tasks.size());
        for (Task t : tasks) {
            TaskDto dto = map(t);
            taskDtos.add(dto);
        }
        return taskDtos;
    }

    public void addTask(TaskDto taskDto) {
        Task task = map(taskDto);
        taskDao.save(task);
    }

    public void deleteTask(Long id) {
        taskDao.delete(id);
    }

    private Task map(TaskDto taskDto) {
        Task task = new Task();
        task.setName(taskDto.getName());
        task.setDescription(taskDto.getDescription());
        return task;
    }

    private TaskDto map(Task task) {
        TaskDto dto = new TaskDto();
        dto.setId(task.getId());
        dto.setName(task.getName());
        dto.setDescription(task.getDescription());
        return dto;
    }
}

