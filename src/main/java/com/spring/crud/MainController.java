package com.spring.crud;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


  @Controller 
  public class MainController {
  
  @RequestMapping(value = "/")
  public String goMain() {
  System.out.println("메인으로가자!");
  
  return "main"; } 
  }
 