package com.example.service;

import com.example.dto.EmployeeDTO;
import com.example.model.Employee;
import com.example.repository.EmployeeRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {
    private final EmployeeRepository employeeRepository;

    public EmployeeServiceImpl(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    @Cacheable("employees")
    @Override
    public Page<EmployeeDTO> paginated(int pageNo, int pageSize, String sortField, String sortDir) {
        Sort sort = sortDir.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by(sortField).ascending() :
                Sort.by(sortField).descending();
        Pageable pageable = PageRequest.of(pageNo - 1, pageSize, sort);
        Page<Employee> employees = employeeRepository.findAll(pageable);
        return employees.map(this::employeeToEmployeeDTO);
    }

    @Override
    public List<EmployeeDTO> findAll() {
        List<Employee> employees = employeeRepository.findAll();
        List<EmployeeDTO> employeeDTOS = new ArrayList<>();
        employees.forEach(employee -> {
            EmployeeDTO employeeDTO = employeeToEmployeeDTO(employee);
            employeeDTOS.add(employeeDTO);
        });
        return employeeDTOS;
    }

    @Override
    public List<EmployeeDTO> searchByKeyword(String keyword) {
        List<Employee> employees = employeeRepository.searchByKeyword(keyword);
        List<EmployeeDTO> employeeDTOS = new ArrayList<>();
        employees.forEach(employee -> {
            EmployeeDTO emp = employeeToEmployeeDTO(employee);
            employeeDTOS.add(emp);
        });
        return employeeDTOS;
    }

    @Cacheable(value = "employee", key = "#id")
    @Override
    public EmployeeDTO findById(Long id) {
        Employee employee = employeeRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("ID not found"));
        return employeeToEmployeeDTO(employee);
    }

    //    @CacheEvict(value = "employees", allEntries = true)
    @Caching(put = @CachePut(value = "employee", key = "#result.id"), evict = @CacheEvict(value = "employees", allEntries = true))
    @Override
    public EmployeeDTO saveEmployee(EmployeeDTO employeeDTO) throws ParseException {
        employeeDTO.setDob(dateStringToDate(employeeDTO.getDobString()));
        Employee saveEmployee = employeeRepository.save(employeeDTOToEmployee(employeeDTO));
        return employeeToEmployeeDTO(saveEmployee);
    }

    @Override
    public void deleteById(Long id) {
        Employee employee = employeeRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("ID not found"));
        employeeRepository.delete(employee);
    }

    private EmployeeDTO employeeToEmployeeDTO(Employee employee) {
        EmployeeDTO employeeDTO = new EmployeeDTO();
        employeeDTO.setId(employee.getId());
        employeeDTO.setFirstName(employee.getFirstName());
        employeeDTO.setLastName(employee.getLastName());
        employeeDTO.setDob(new Date(employee.getDob()));
        employeeDTO.setDobString(convertDateToString(employeeDTO.getDob()));
        employeeDTO.setLogin(employee.getLogin());
        employeeDTO.setMobileNo(employee.getMobileNo());
        employeeDTO.setGender(employee.getGender());
        return employeeDTO;
    }

    private Employee employeeDTOToEmployee(EmployeeDTO employeeDTO) {
        Employee employee = new Employee();
        employee.setId(employeeDTO.getId());
        employee.setFirstName(employeeDTO.getFirstName());
        employee.setLastName(employeeDTO.getLastName());
        employee.setDob(employeeDTO.getDob().getTime());
        employee.setLogin(employeeDTO.getLogin());
        employee.setMobileNo(employeeDTO.getMobileNo());
        employee.setGender(employeeDTO.getGender());
        return employee;
    }

    private String convertDateToString(Date date) {
        Format format = new SimpleDateFormat("yyyy-MM-dd");
        return format.format(date);
    }

    private Date dateStringToDate(String date) throws ParseException {
        return new SimpleDateFormat("yyyy-MM-dd").parse(date);
    }

    private void sleep() {
        try {
            long time = 2000L;
            Thread.sleep(time);
        } catch (InterruptedException e) {
            throw new IllegalStateException(e);
        }
    }
}
