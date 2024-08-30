package com.example.myDemoApp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class MyDemoAppApplication {

	public static void main(String[] args) {

		SpringApplication.run(MyDemoAppApplication.class, args);
	}

	@RestController
	@RequestMapping("/api")
	public class MyDemoAppController {

		@GetMapping("/hello")
		public String sayHello() {
			return "Hello World";
		}
	}

}
