package com.example.controller;

import com.example.dto.EmployeeDTO;
import com.example.model.Employee;
import com.example.service.EmployeeService;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping(value = "/api/v1/employees")
public class EmployeeController {
    private final EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @GetMapping("/page/{pageNo}")
    public ModelAndView getEmployeeListPage(@PathVariable(value = "pageNo", required = false) int pageNo,
                                            @RequestParam(value = "pageSize", defaultValue = "5", required = false) int pageSize,
                                            @RequestParam(value = "sortField", defaultValue = "id", required = false) String sortField,
                                            @RequestParam(value = "sortDir", defaultValue = "desc", required = false) String sortDir,
                                            HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("employee-table");
        Page<EmployeeDTO> page = employeeService.paginated(pageNo, pageSize, sortField, sortDir);

        mav.addObject("currentPage", pageNo);
        mav.addObject("totalPages", page.getTotalPages());
        mav.addObject("totalItems", page.getTotalElements());
        mav.addObject("employees", page.getContent());
        mav.addObject("sortField", sortField);
        mav.addObject("sortDir", sortDir);
        mav.addObject("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");
        mav.addObject("url", "?sortField=" + sortField + "&sortDir=" + sortDir);
        return mav;
    }

    @GetMapping("/")
    public ModelAndView getEmployeeListPage() {
        ModelAndView mav = new ModelAndView("employees");
//        mav.addObject("employees", employeeService.findAll());
        return mav;
    }

    @GetMapping(value = "/get-list")
    public @ResponseBody ResponseEntity<?> findAll() {
        Map<String, Object> map = new HashMap<>();
        map.put("data", employeeService.findAll());
        return ResponseEntity.ok(map);
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
        return "redirect:/api/v1/employees/page/1";
    }
}
