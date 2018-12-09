package com.oraclewdp.ddbookmaket.dao.impl;

import com.oraclewdp.ddbookmaket.dao.AdminDao;
import com.oraclewdp.ddbookmaket.model.Admin;

import com.oraclewdp.ddbookmaket.util.DBUtil;
import com.oraclewdp.ddbookmaket.util.MD5Util;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.*;


public class AdminDaojdbcImpl implements AdminDao {
    @Override
    public boolean find(Admin admin) {
        Connection conn=null;
        PreparedStatement stmt=null;
        ResultSet rs=null;
        try {
            conn=DBUtil.getConnection();
           /* String sql="select * from t_admin where name=? and pwd=?";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1,admin.getName());
            try {
                stmt.setString(2, MD5Util.getEncryptedPwd("admin.getPwd()"));
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }*/
            String sql="select pwd from t_admin where name=?";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1,admin.getName());
            rs=stmt.executeQuery();
            if(rs.next()) {
                String dbPwd=rs.getString(1);
                try {
                    return MD5Util.validPasswd(admin.getPwd(),dbPwd);
                } catch (NoSuchAlgorithmException e) {
                    e.printStackTrace();
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.free(rs, stmt, conn);
        }
        return false;
    }
}
