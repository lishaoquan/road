/**
 * 
 */
package com.contact.test.controlller;

import com.jfinal.core.Controller;

/**
 * jfinal����������
 * @author Administrator
 *
 */
public class HelloWordController extends Controller {
	
	public void index() {
		renderText("Hello JFinal World.");
		}
	
	public void other(){
		renderText("�Զ��巽��.");
	}
}
