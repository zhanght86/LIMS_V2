package com.boncontact.base;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.UUID;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.boncontact.util.MD5Utils;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author 瞿龙俊
 * 
 */
@Component("fileAction")
public class FileAction extends ActionSupport {
	private static final long serialVersionUID = -5330339377624033962L;
	private File file;
	private String fileFileName;
	private String fileFileContentType;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	private String message = "你已成功上传文件";
	private int type;

	@SuppressWarnings("deprecation")
	@Override
	public String execute() throws Exception {
		//1.修改存储的文件名，使用UUID或者其他技术，保证不被重复
		//2.尝试可否使用服务器地址
		String path="";
		String savePath="";
		String fileNameMD5=this.fileFileName;
		System.out.println(this.fileFileContentType);
		if (type == 0) {
			//通用模版上传
			savePath = ServletActionContext.getRequest().getRealPath(
					"/commonTemplet");
		}
		if (type == 1) {
			//实验分析员上传原始记录表
			fileNameMD5=MD5Utils.GetMD5Code(this.getFileFileName());
			savePath= ServletActionContext.getRequest().getRealPath(
					"/originalRecord");
			path="originalRecord";
		}
		if (type == 2) {
			//公告附件
			savePath = ServletActionContext.getRequest().getRealPath(
					"/noticeFile");
		}
		try {
			File f = this.getFile();
			if (this.getFileFileName().endsWith(".exe")) {
				message = "对不起,你上传的文件格式不允许!!!";
				jsonResult = "{'info':'failed'}";
				return SUCCESS;
				// return ERROR;
			}
			FileInputStream inputStream = new FileInputStream(f);
			FileOutputStream outputStream = new FileOutputStream(savePath + "/"
					+ fileNameMD5);
			byte[] buf = new byte[1024];
			int length = 0;
			while ((length = inputStream.read(buf)) != -1) {
				outputStream.write(buf, 0, length);
			}
			inputStream.close();
			outputStream.flush();
			outputStream.close();
			String realPath = path + "/" +fileNameMD5;
			jsonResult = "{'info':'success','path':'" + realPath + "'}";
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult = "{'info':'failed'}";
			message = "对不起,文件上传失败了!!!!";
		}
		return SUCCESS;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileFileContentType() {
		return fileFileContentType;
	}

	public void setFileFileContentType(String fileFileContentType) {
		this.fileFileContentType = fileFileContentType;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(String jsonResult) {
		this.jsonResult = jsonResult;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
