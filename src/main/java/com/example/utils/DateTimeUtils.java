package com.example.utils;

import lombok.experimental.UtilityClass;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@UtilityClass
public class DateTimeUtils {
    public static final String DATE_FORMAT = "dd-MM-yyyy";
    public final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern(DATE_FORMAT);

    public String getDateFormat(LocalDate localDate) {
        return localDate.format(DATE_FORMATTER);
    }
}
