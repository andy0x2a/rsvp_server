package com.newmansoft.service;

import com.newmansoft.model.MealChoice;
import com.newmansoft.model.PlusOne;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by user on 1/24/2015.
 */

@Service
public class PlusOneService extends Database {


    public int save(PlusOne plusOneInfo, Long id) {
//        int res = getJdbcTemplate().update(
//                "INSERT INTO plusone (guestID, name, mealId ) values(?,?,?)",
//                id, plusOneInfo.getName(), plusOneInfo.getMealChoiceId());
//
//
//
//        System.out.println("result:" + res);
//       return res;


        Map<String, Object> parameters = new HashMap<String, Object>();
        parameters.put("guestID", id);
        parameters.put("Name", plusOneInfo.getName());
        parameters.put("mealId", plusOneInfo.getMealChoiceId());

        SimpleJdbcInsert insert = getJdbcInsert("plusone");

        insert.withTableName("plusone");

        insert.setGeneratedKeyName("id"); //e.g. "ID"

//        jdbcInsert.setColumnNames(columnNames)
//execute insert
        Number key = insert.executeAndReturnKey(new MapSqlParameterSource(parameters));
//set generated key
        if (key != null) {
            plusOneInfo.setId(key.longValue());
        }

        return key.intValue();
    }
}
