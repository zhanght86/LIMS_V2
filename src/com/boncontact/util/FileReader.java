package com.boncontact.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;


import com.boncontact.base.BaseAction;
import com.boncontact.domain.CommonTemplet;
import com.boncontact.domain.Department;

public class FileReader extends BaseAction<CommonTemplet> {
	private static final long serialVersionUID = -1608518047105483641L;

	public static void main(String[] args) {
		FileReader fr = new FileReader();
		fr.addFile();
	}

	public String addFile() {
		// 目录
		File dataDir = new File("C:/Users/瞿龙俊/Desktop/LIMS/监测中心原始记录表");
		// 存放目录及其子目录下的所有文件对象
		List<File> myfile = new ArrayList<File>();
		// 开始遍历
		listDirectory(dataDir, myfile);
		System.out.println("目录下包含 " + myfile.size() + "个文件：");
		int index = 1;
		for (File file : myfile) {
			CommonTemplet ct = new CommonTemplet();
			ct.setIdentify(index + "");
			ct.setFilesId("原始记录表" + index);
			ct.setName(file.getName());
			String realPath=ServletActionContext.getRequest().getRealPath(
					"/commonTemplet");
			ct.setPath(realPath+"/"+ file.getName());
			
			Set<Department> de = new HashSet<Department>();
			de.add(departmentService.getById(1L));
			ct.setUseDepartment(de);
			commonTempletService.save(ct);
			System.out.println(file.getName().substring(0, 11));
			System.out.println(file.getName().substring(12));
			index++;
		}
		return null;
	}

	/**
	 * 遍历目录及其子目录下的所有文件并保存
	 * 
	 * @param path
	 *            目录全路径
	 * @param myfile
	 *            列表：保存文件对象
	 */
	public static void listDirectory(File path, List<File> myfile) {
		if (!path.exists()) {
			System.out.println("文件名称不存在!");
		} else {
			if (path.isFile()) {
				myfile.add(path);
			} else {
				File[] files = path.listFiles();
				for (int i = 0; i < files.length; i++) {
					listDirectory(files[i], myfile);
				}
			}
		}
	}
}
