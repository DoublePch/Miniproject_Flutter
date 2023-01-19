package com.example.todo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

import lombok.Data;
@Data

@Entity
public class Task {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@NotNull(message = "title is required")
	private String title;
	
	private boolean done;
	
	public Task() {
		
	}
	
	public Task(String title) {
		this.title = title;
		this.done = false; 
	}
}
