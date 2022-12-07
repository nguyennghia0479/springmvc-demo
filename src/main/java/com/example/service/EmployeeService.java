package com.example.service;

import com.example.dto.EmployeeDTO;

import java.text.ParseException;
import java.util.List;

public interface EmployeeService {
    List<EmployeeDTO> findAll();
    List<EmployeeDTO> searchByKeyword(String keyword);
    EmployeeDTO findById(Long id);
    EmployeeDTO saveEmployee(EmployeeDTO employeeDTO) throws ParseException;
    void deleteById(Long id);
}
