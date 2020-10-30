//package com.tom.login_boot.config;
//
//import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceBuilder;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.boot.context.properties.ConfigurationProperties;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.context.annotation.Primary;
//import org.springframework.jdbc.core.JdbcTemplate;
//
//import javax.sql.DataSource;
//
//@Configuration
//public class DSConfig {
//    @Bean(name = "primaryDataSource")
//    @Qualifier("primaryDataSource")
//    @ConfigurationProperties(prefix = "spring.datasource.primary")
//    public DataSource primaryDataSource(){
//        return DruidDataSourceBuilder.create().build();
//        //return DataSourceBuilder.create().build();
//    }
//
//    @Bean(name = "secondaryDataSource")
//    @Qualifier("secondaryDataSource")
//    @Primary
//    @ConfigurationProperties(prefix = "spring.datasource.secondary")
//
//    public DataSource secondaryDataSource(){
//    	    return DruidDataSourceBuilder.create().build();
//        //return DataSourceBuilder.create().build();
//    }
//    @Bean(name = "thirdDataSource")
//    @Qualifier("thirdDataSource")
//    @ConfigurationProperties(prefix = "spring.datasource.third")
//    public DataSource thirdDataSource(){
//    	    return DruidDataSourceBuilder.create().build();
//        //return DataSourceBuilder.create().build();
//    }
//
//    @Bean(name = "primaryJdbcTemplate")
//    public JdbcTemplate primaryJdbcTemplate(@Qualifier("primaryDataSource")DataSource dataSource){
//        return new JdbcTemplate(dataSource);
//    }
//
//    @Bean(name = "secondaryJdbcTemplate")
//    public JdbcTemplate secondaryJdbcTemplate(@Qualifier("secondaryDataSource")DataSource dataSource){
//        return new JdbcTemplate(dataSource);
//    }
//    @Bean(name = "thirdJdbcTemplate")
//    public JdbcTemplate thirdJdbcTemplate(@Qualifier("thirdDataSource")DataSource dataSource){
//        return new JdbcTemplate(dataSource);
//    }
//}