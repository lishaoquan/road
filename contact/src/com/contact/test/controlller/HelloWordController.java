/**
 * 
 */
package com.contact.test.controlller;

import com.jfinal.core.Controller;

/**
 * jfinal控制器测试
 * @author Administrator
 *
 */
public class HelloWordController extends Controller {
	
	public void index() {
		renderText("Hello JFinal World.");
	}
	
	public void other(){
		renderText("自定义方法.");
	}
}
