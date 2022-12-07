package com.example.model;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "Employee")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "emp_ID")
    private Long id;

    @Column(name = "emp_FIRST_NAME", nullable = false, length = 100)
    private String firstName;

    @Column(name = "emp_LAST_NAME", nullable = false, length = 100)
    private String lastName;

    @Column(name = "emp_DATE_OF_BIRTH", nullable = false)
    private Long dob;

    @Column(name = "emp_LOGIN", nullable = false, length = 100, unique = true)
    private String login;

    @Column(name = "emp_MOBILE_NO", nullable = false, length = 10, unique = true)
    private String mobileNo;

    @Column(name = "emp_GENDER", nullable = false, length = 10)
    @Enumerated(EnumType.STRING)
    private Gender gender;

    public enum Gender {
        MALE,
        FEMALE
    }
}
