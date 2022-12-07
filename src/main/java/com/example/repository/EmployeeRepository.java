package com.example.repository;

import com.example.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long> {
    @Query(value = "SELECT e FROM Employee e WHERE e.firstName LIKE '%' || :keyword || '%'"
            + " OR e.lastName LIKE '%' || :keyword || '%'"
            + " OR e.login LIKE '%' || :keyword || '%'")
    List<Employee> searchByKeyword(@Param("keyword") String keyword);
}
