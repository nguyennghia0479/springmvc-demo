package com.example.controller;

import com.example.dto.EmployeeDTO;
import com.example.model.Employee;
import com.example.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;

@Controller
@RequestMapping("/api/v1/employees")
public class EmployeeController {
    private final EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @GetMapping("/")
    public ModelAndView getEmployeeListPage() {
        ModelAndView mav = new ModelAndView("employee-table");
        mav.addObject("employees", employeeService.findAll());
        return mav;
    }

    @GetMapping("/search")
    public ModelAndView getEmployeesBySearch(@RequestParam("keyword") String keyword) {
        ModelAndView mav = new ModelAndView("employee-table");
        mav.addObject("employees", employeeService.searchByKeyword(keyword));
        return mav;
    }

    @GetMapping("/add")
    public ModelAndView addEmployeeFormPage() {
        ModelAndView mav = new ModelAndView("employee-form");
        mav.addObject("employee", new EmployeeDTO());
        mav.addObject("genderRadio", Employee.Gender.values());
        return mav;
    }

    @GetMapping("/{id}")
    public ModelAndView getEmployeeFormPage(@PathVariable("id") Long id) {
        ModelAndView mav = new ModelAndView(("employee-form"));
        mav.addObject("employee", employeeService.findById(id));
        mav.addObject("genderRadio", Employee.Gender.values());
        return mav;
    }

    @PostMapping("/save")
    public String saveEmployee(@ModelAttribute("employee") EmployeeDTO employee) throws ParseException {
        employeeService.saveEmployee(employee);
        return "redirect:/api/v1/employees/";
    }
}
