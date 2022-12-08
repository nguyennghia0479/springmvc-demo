package com.example.service;

import com.example.dto.EmployeeDTO;
import org.springframework.data.domain.Page;

import java.text.ParseException;
import java.util.List;

public interface EmployeeService {
    Page<EmployeeDTO> paginated(int pageNo, int pageSize, String sortField, String sortDir);

    List<EmployeeDTO> findAll();

    List<EmployeeDTO> searchByKeyword(String keyword);

    EmployeeDTO findById(Long id);

    EmployeeDTO saveEmployee(EmployeeDTO employeeDTO) throws ParseException;

    void deleteById(Long id);
}
