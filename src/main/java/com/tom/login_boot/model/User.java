package com.tom.login_boot.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.ToString;


@Data
@ToString
public class User {
    private String userId;
    @JsonIgnore
    private String employeeCode;
    private String username;
    private String password;
    private String phone;
    private String createTime;

}
