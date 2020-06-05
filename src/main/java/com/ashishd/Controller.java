package com.ashishd;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    @GetMapping(value = "/greeting")
    public ResponseEntity<String>  greet(){
        return ResponseEntity.ok("Hello from container");
    }
}