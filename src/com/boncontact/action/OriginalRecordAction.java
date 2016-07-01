package com.boncontact.action;

import java.io.File;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.AnalysisCategory;
import com.boncontact.domain.CommonTemplet;
import com.boncontact.domain.Department;
import com.boncontact.domain.OriginalRecord;
import com.boncontact.domain.User;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;
@Component("originalRecord")
public class OriginalRecordAction extends BaseAction<OriginalRecord> {
	private static final long serialVersionUID = 4985743979061967773L;
	/* 上传文件存放路径 */
	private final static String UPLOADDIR = "/commonTemplet";
	/* 通用模版实体 */
	private OriginalRecord entity;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	// 文件名，包括路径
	private String fileName;
	// 真实文件名，不包括路径
	private String realFileName;
	/* id */
	private Long viewId;
	/* 用来存放查询的条件 */
	private String queryStr;
	/* 批量删除的id */
	private String ids;
	/* 选择的类型 */
	private int type;
	/*环境要素Id*/
	private Long categoryId;
	public String main(){
		List<AnalysisCategory> categories=analysisCategoryService.findAll("");
		ActionContext.getContext().put("categories", categories);
		
		List<OriginalRecord> record=originalRecordService.findAll("");
		ActionContext.getContext().put("record", record);
		ActionContext.getContext().put("totalRecord", record.size());
		ActionContext.getContext().put(
				"totalPage",
				(int) Math.ceil(record.size()
						/ (double) pageRowCount));
		return "main";
	}
	
	public String addPage(){
		List<AnalysisCategory> categories=analysisCategoryService.findAll("");
		ActionContext.getContext().put("categories", categories);
		return "addPage";
	}
	public String addAllPage(){
		List<AnalysisCategory> categories=analysisCategoryService.findAll("");
		ActionContext.getContext().put("categories", categories);
		return "addAllPage";
	}
	
	/**
	 * 新增Action
	 * 
	 * @return
	 */
	public String add() {
		Set<Department> department = new LinkedHashSet<Department>();
		try {
			if (categoryId != null) {
				AnalysisCategory category=analysisCategoryService.getById(categoryId);
				entity.setCategory(category);
			}
			originalRecordService.save(entity);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}
	
	public String delete(){
		try{
			OriginalRecord originalRecord=originalRecordService.getById(viewId);
			String path=ServletActionContext.getRequest().getRealPath(originalRecord.getPath());
			File templateFile=new File(path);
			boolean isFileExists=templateFile.exists();
			if(isFileExists){
				templateFile.delete();
				originalRecordService.delete(viewId);
				System.out.println(path+"文件删除成功");
			}else{
				System.out.println(path+"路径下未发现文件");
				originalRecordService.delete(viewId);
			}
			jsonResult = "{'info':'success'}";
		}catch(Exception e){
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}
	public String deleteAll() {
		try {
			String[] idList = StringSplitUtils.splite(ids, ";");
			for (int i = 0; i < idList.length; i++) {
				Long id = Long.parseLong(idList[i]);
				OriginalRecord originalRecord=originalRecordService.getById(id);
				String path=ServletActionContext.getRequest().getRealPath(originalRecord.getPath());
				File templateFile=new File(path);
				boolean isFileExists=templateFile.exists();
				if(isFileExists){
					templateFile.delete();
					originalRecordService.delete(id);
					System.out.println(path+"文件删除成功");
				}else{
					System.out.println(path+"路径下未发现文件");
					originalRecordService.delete(id);
				}
			}
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}
	
	/**
	 * 查询按钮
	 * 
	 * @return
	 */
	public String query() {
		List<OriginalRecord> originalRecordList = new ArrayList<OriginalRecord>();
		if (queryStr != null) {
			String[] queryInfo = StringSplitUtils.splite(queryStr, ";");
			String query = "";
			String condition = "where ";
			String middle = " inner join fetch c.category u ";
			int sign = 0;
			for (int i = 0; i < queryInfo.length; i++) {
				String key = StringSplitUtils.splite(queryInfo[i], "=")[0];
				String value = StringSplitUtils.splite(queryInfo[i], "=")[1];
				if (key == "u.id") {
					sign = 1;
				}
				if (i != queryInfo.length - 1) {
					if (key.equalsIgnoreCase("u.id")) {
						query += (key + " = " + value + " and ");
					} else {
						query += (key + " like '%" + value + "%' and ");
					}
				} else {
					if (key.equalsIgnoreCase("u.id")) {
						query += (key + " = " + value);
					} else {
						query += (key + " like '%" + value + "%'");
					}
				}
			}
			if (query == "") {
				originalRecordList = originalRecordService.findAll("");
			} else {
				originalRecordList = originalRecordService.findAll(middle
						+ condition + query+" Group by c.id");
			}
		}
		List<AnalysisCategory> categories=analysisCategoryService.findAll("");
		ActionContext.getContext().put("categories", categories);
		
		ActionContext.getContext().put("record", originalRecordList);
		ActionContext.getContext().put("totalRecord", originalRecordList.size());
		ActionContext.getContext().put(
				"totalPage",
				(int) Math.ceil(originalRecordList.size()
						/ (double) pageRowCount));
		return "main";
	}
	
	public String viewPage(){
		if(viewId!=null){
			ActionContext.getContext().put("entity", originalRecordService.getById(viewId));
			
		}
		return "viewPage";
	}
	
	public String getJsonResult() {
		return jsonResult;
	}
	public void setJsonResult(String jsonResult) {
		this.jsonResult = jsonResult;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getRealFileName() {
		return realFileName;
	}
	public void setRealFileName(String realFileName) {
		this.realFileName = realFileName;
	}
	public Long getViewId() {
		return viewId;
	}
	public void setViewId(Long viewId) {
		this.viewId = viewId;
	}
	public String getQueryStr() {
		return queryStr;
	}
	public void setQueryStr(String queryStr) {
		this.queryStr = queryStr;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	@Override
	public OriginalRecord getModel() {
		if(entity==null){
			entity=new OriginalRecord();
		}
		return entity;
	}
}
