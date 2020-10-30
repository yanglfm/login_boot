package com.tom.login_boot.model;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class User {
    private String id;
    private String employeeCode;
    private String username;
    private String password;
}
