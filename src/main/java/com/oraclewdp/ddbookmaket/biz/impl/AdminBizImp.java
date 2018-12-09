package com.oraclewdp.ddbookmaket.biz.impl;

import com.oraclewdp.ddbookmaket.biz.AdminBiz;
import com.oraclewdp.ddbookmaket.dao.AdminDao;
import com.oraclewdp.ddbookmaket.dao.impl.AdminDaojdbcImpl;
import com.oraclewdp.ddbookmaket.model.Admin;

public class AdminBizImp implements AdminBiz {

    @Override
    public boolean findAdmin(Admin admin) {
        AdminDao adminDao=new AdminDaojdbcImpl();
        return adminDao.find(admin);
    }
}
