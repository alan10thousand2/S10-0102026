package com.example.S10_0102026;

import java.time.LocalDateTime;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

  @GetMapping("/api/home")
  public String home() {
    return "API is running!";
  }

  @GetMapping("/")
  public String healthCheck() {
    return "Service OK - " + LocalDateTime.now();
  }
}
