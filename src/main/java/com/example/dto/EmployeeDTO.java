package com.example.dto;

import com.example.model.Employee;
import lombok.*;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EmployeeDTO implements Serializable {
    private Long id;
    private String firstName;
    private String lastName;
    private Date dob;
    private String dobString;
    private String login;
    private String mobileNo;
    private Employee.Gender gender;
}
