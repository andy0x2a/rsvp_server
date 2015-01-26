package com.newmansoft.service;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;

/**
 * Created by andyn on 1/26/2015.
 */
@Service
public class Database {

    private SimpleDriverDataSource dataSource;
    private JdbcTemplate jdbcTemplate;

    public SimpleDriverDataSource getDataSource() {
        return dataSource;
    }

    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }

    public  Database() {
        dataSource = new SimpleDriverDataSource();
        dataSource.setDriverClass(com.mysql.jdbc.Driver.class);
        dataSource.setUsername("root");
        dataSource.setUrl("jdbc:mysql://localhost/RSVP");
        dataSource.setPassword("root");

        jdbcTemplate = new JdbcTemplate(dataSource);
    }



}