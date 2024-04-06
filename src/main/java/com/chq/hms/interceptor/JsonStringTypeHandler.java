package com.chq.hms.interceptor;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * JSON类型拦截器，将JSON字符串反序列化为Java对象
 * @param <T>
 */
public class JsonStringTypeHandler<T> implements TypeHandler<T> {

    private static final ObjectMapper objectMapper = new ObjectMapper();
    private final Class<T> type;

    public JsonStringTypeHandler(Class<T> type) {
        this.type = type;
    }

    @Override
    public void setParameter(PreparedStatement ps, int i, T parameter, JdbcType jdbcType) throws SQLException {
        try {
            ps.setString(i, objectMapper.writeValueAsString(parameter));
        } catch (Exception e) {
            throw new SQLException("Error converting JSON to String", e);
        }
    }

    @Override
    public T getResult(ResultSet rs, String columnName) throws SQLException {
        return this.getResult(rs.getString(columnName));
    }

    @Override
    public T getResult(ResultSet rs, int columnIndex) throws SQLException {
        return this.getResult(rs.getString(columnIndex));
    }

    @Override
    public T getResult(CallableStatement cs, int columnIndex) throws SQLException {
        return this.getResult(cs.getString(columnIndex));
    }

    private T getResult(String json) throws SQLException {
        if (json == null) {
            return null;
        }
        try {
//            return objectMapper.readValue(json, new TypeReference<T>() {});
            return objectMapper.readValue(json, type);
        } catch (IOException e) {
            throw new SQLException("Error converting JSON to Object", e);
        }
    }
}
