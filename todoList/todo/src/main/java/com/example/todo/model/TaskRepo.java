package com.example.todo.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface TaskRepo extends JpaRepository <Task,Long>{

}
