package com.example.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResponseDTO {
    private Object content;
    private int total;
    private int rows;
}
