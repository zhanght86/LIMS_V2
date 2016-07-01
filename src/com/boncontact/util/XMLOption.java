package com.boncontact.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;


import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.Power;

public class XMLOption  extends BaseAction<Power>{
	private static final long serialVersionUID = -8077343632076611517L;

	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<Power> readXML() throws Exception {
		SAXReader reader = new SAXReader();
		File file = new File(ServletActionContext.getRequest().getRealPath(
				"/power.xml"));
		Document document = reader.read(file);
		Element root = document.getRootElement();
		List<Element> childElements = root.elements();
		List<Power> powerList=new ArrayList<Power>();
		for (Element child : childElements) {
			String identify=child.elementText("identify");
			String action=child.elementText("action");
			System.out.println("当前"+identify);
			Power entity=new Power();
			entity.setIdentify(identify);
			entity.setPowerAction(action);
			powerList.add(entity);
		}
		return powerList;
	}
}