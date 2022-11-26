package com.example.githubaction;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ActionsController {

	@GetMapping("actions")
	public String actions(){
		return "auto ci/cd----";
	}
}
