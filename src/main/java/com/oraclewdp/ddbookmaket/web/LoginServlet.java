package com.oraclewdp.ddbookmaket.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import com.oraclewdp.ddbookmaket.biz.AdminBiz;
import com.oraclewdp.ddbookmaket.biz.impl.AdminBizImp;
import com.oraclewdp.ddbookmaket.model.Admin;
import com.oraclewdp.ddbookmaket.util.MyBeanUtils;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setCharacterEncoding("utf-8");
        Admin admin=new Admin();
        MyBeanUtils.populate(admin, request.getParameterMap());
        //验证码比较
        String vcode=request.getParameter("vcode");
		String strVcode= (String) request.getSession().getAttribute("validateCode");
		/*if(!strVcode.equalsIgnoreCase(vcode)){
		    request.setAttribute("msg","验证码错误");
            request.setAttribute("admin", admin);//把用户填写的User信息带过去
            //就返回注册页面，重新填写
            request.getRequestDispatcher("login.jsp").forward(request, response);
		    return;
        }
        //校验
		ValidatorFactory validatorFactory= Validation.buildDefaultValidatorFactory();
		Validator validator = validatorFactory.getValidator();
		//违反的约束
		Set<ConstraintViolation<Admin>> violationResult=validator.validate(admin);
		if(violationResult.size()>0){
			Map<String,String> errors=new HashMap<>();
			for (ConstraintViolation<Admin> cv:
				violationResult ) {
				errors.put(cv.getPropertyPath().toString(),cv.getMessage());
			}
			request.setAttribute("errors",errors);
			request.setAttribute("admin", admin);//把用户填写的User信息带过去
			//就返回注册页面，重新填写
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}*/
		Map<String,String> errors=new HashMap<>();
		if(!strVcode.equalsIgnoreCase(vcode)){
			errors.put("vcode","验证码错误");
		}
		ValidatorFactory validatorFactory= Validation.buildDefaultValidatorFactory();
		Validator validator = validatorFactory.getValidator();
		//违反的约束
		Set<ConstraintViolation<Admin>> violationResult=validator.validate(admin);
		if(violationResult.size()>0) {
			for (ConstraintViolation<Admin> cv :violationResult) {
				errors.put(cv.getPropertyPath().toString(), cv.getMessage());
			}
		}
		if(errors.size()>0){
			request.setAttribute("errors",errors);
			request.setAttribute("admin", admin);//把用户填写的User信息带过去
			//就返回注册页面，重新填写
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}

		//数据库保存
		AdminBiz adminBiz =new AdminBizImp();
		boolean ret=adminBiz.findAdmin(admin);
		//如果成功
		if(ret) {
			//就进入成功页面
			request.getSession().setAttribute("haslogined",true);
			request.getRequestDispatcher("main.jsp").forward(request, response);
		}else {//否则
			request.setAttribute("admin", admin);//把用户填写的User信息带过去
			//就返回注册页面，重新填写
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
}
