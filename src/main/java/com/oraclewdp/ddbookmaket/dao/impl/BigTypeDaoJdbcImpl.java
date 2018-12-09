package com.oraclewdp.ddbookmaket.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.oraclewdp.ddbookmaket.dao.BigTypeDao;
import com.oraclewdp.ddbookmaket.model.BigType;
import com.oraclewdp.ddbookmaket.util.DBUtil;

public class BigTypeDaoJdbcImpl implements BigTypeDao {

	@Override
	public boolean save(String name) {
		Connection conn=null;
		PreparedStatement stmt=null;
		try {
			conn=DBUtil.getConnection();
			String sql="insert into t_big_type values(default,?)";
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, name);
			int ret=stmt.executeUpdate();
			if(ret>0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.free(stmt, conn);
		}
		return false;
	}

	@Override
	public List<BigType> findAll() {
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			conn=DBUtil.getConnection();
			stmt=conn.createStatement();
			String sql="select * from t_big_type";
			rs=stmt.executeQuery(sql);
			List<BigType> ls=new ArrayList<>();
			while(rs.next()) {
				BigType bigType=new BigType();
				bigType.setId(rs.getInt("id"));
				bigType.setName(rs.getString("name"));
				ls.add(bigType);
			}
			return ls;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.free(rs, stmt, conn);
		}
		return null;
	}

}
