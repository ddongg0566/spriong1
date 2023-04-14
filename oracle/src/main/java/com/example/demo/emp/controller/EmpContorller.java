package com.example.demo.emp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.emp.mapper.EmpMapper;

@Controller
public class EmpContorller {
	@Autowired
	EmpMapper dao;

	@GetMapping("/empList")
	public String empList(Model model) {
		model.addAttribute("empList",dao.getEmpListVO(null));
		return "empList";
	}
	
	
	
}
