package com.boncontact.domain;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.TreeSet;

import com.boncontact.util.Compara;

/**
 * 业务工程实体 该实体作用：协调统筹整个业务流程，从合同签署到最终的交付客户，该实体均进行流程管理 记录各个阶段产生的业务编号
 * 
 * @author 瞿龙俊
 * 
 */
/**
 * @author 瞿龙俊
 * 
 */
public class Project{
	// 主键
	private Long id;
	// 合同id号
	private String contractId;
	// 业务合同编号，唯一
	private TrafficContract tContractId;
	// 服务合同编号
	private ServiceContract sContractId;
	// 项目进程，-2:项目中止，-1:合同修改 0：合同起草，1：合同审核，2：任务书下达 3:样品登记（交联，送检）4:质量控制 5:样品交接（样品管理员）
	// 6:实验分析室(主任分配任务) 7.实验分析-实验结果复核 8.一审通过 9:二审通过 10：报告编制完成 报告一审 、 报告二审、签发人审核
	// 11：签收 项目结束
	private int process;
	// 合同承办人
	private User draftsMan;
	// 合同重写次数
	private int rewriteCount;
	// 草案生成时间
	private Date createTime;
	// 合同审核意见
	private ContractAudit contractAudit;
	/* 合同变更记录 */
	private Set<ContractChange> contractChange = new LinkedHashSet<ContractChange>();
	// 合同审核职位
	private Role contractAuditRole;
	// 业务登记表
	private BusinessRegistration businessRegistration;
	// 任务书
	private ProjectBook projectBook;
	/* 送样方法：0：非自送样->现场监测室。1：自送样->实验分析室 */
	private String gainSample;
	/* 自送样样品信息 */
	private Set<SelfSendSampleInfo> selfSendSampleInfo = new TreeSet<SelfSendSampleInfo>();
	/* 非自送样样品信息 */
	private Set<NonSelfSendSample> nonSelfSendSampleInfo = new TreeSet<NonSelfSendSample>();
	/* 交联单 */
	private Set<DeliveryReceitp> deliveryReceitpInfo = new LinkedHashSet<DeliveryReceitp>();
	/* 送检单 */
	private Set<InspectionSheet> inspectionSheet = new LinkedHashSet<InspectionSheet>();
	/* 已经生成送检单的项目 */
	private Set<AnalysisProject> analysisedProject = new LinkedHashSet<AnalysisProject>();
	/* 质量控制 */
	private Set<QualityControl> qualityControlSet = new LinkedHashSet<QualityControl>();
	/* 制表日期 */
	private Date QualityControlDate;
	/* 制表人 */
	private User QualityControlUser;
	/* 原始记录审核表 */
	private RecordAudit recordAudit;
	/* 监测报告 */
	private Set<Report> reportSet = new LinkedHashSet<Report>();
	
	private Set<Delivery_SampleType> sampleTypeSet = new TreeSet<>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public TrafficContract gettContractId() {
		return tContractId;
	}

	public void settContractId(TrafficContract tContractId) {
		this.tContractId = tContractId;
	}

	public ServiceContract getsContractId() {
		return sContractId;
	}

	public void setsContractId(ServiceContract sContractId) {
		this.sContractId = sContractId;
	}

	public int getProcess() {
		return process;
	}

	public void setProcess(int process) {
		this.process = process;
	}

	public User getDraftsMan() {
		return draftsMan;
	}

	public void setDraftsMan(User draftsMan) {
		this.draftsMan = draftsMan;
	}

	public int getRewriteCount() {
		return rewriteCount;
	}

	public void setRewriteCount(int rewriteCount) {
		this.rewriteCount = rewriteCount;
	}

	public ContractAudit getContractAudit() {
		return contractAudit;
	}

	public void setContractAudit(ContractAudit contractAudit) {
		this.contractAudit = contractAudit;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Role getContractAuditRole() {
		return contractAuditRole;
	}

	public void setContractAuditRole(Role contractAuditRole) {
		this.contractAuditRole = contractAuditRole;
	}

	public String getContractId() {
		return contractId;
	}

	public void setContractId(String contractId) {
		this.contractId = contractId;
	}

	public BusinessRegistration getBusinessRegistration() {
		return businessRegistration;
	}

	public void setBusinessRegistration(
			BusinessRegistration businessRegistration) {
		this.businessRegistration = businessRegistration;
	}

	public ProjectBook getProjectBook() {
		return projectBook;
	}

	public void setProjectBook(ProjectBook projectBook) {
		this.projectBook = projectBook;
	}

	public String getGainSample() {
		return gainSample;
	}

	public void setGainSample(String gainSample) {
		this.gainSample = gainSample;
	}

	public Set<SelfSendSampleInfo> getSelfSendSampleInfo() {
		return selfSendSampleInfo;
	}

	public void setSelfSendSampleInfo(Set<SelfSendSampleInfo> selfSendSampleInfo) {
		this.selfSendSampleInfo = selfSendSampleInfo;
	}

	public Set<DeliveryReceitp> getDeliveryReceitpInfo() {
		return deliveryReceitpInfo;
	}

	public void setDeliveryReceitpInfo(Set<DeliveryReceitp> deliveryReceitpInfo) {
		this.deliveryReceitpInfo = deliveryReceitpInfo;
	}

	public Set<InspectionSheet> getInspectionSheet() {
		return inspectionSheet;
	}

	public void setInspectionSheet(Set<InspectionSheet> inspectionSheet) {
		this.inspectionSheet = inspectionSheet;
	}

	public Set<AnalysisProject> getAnalysisedProject() {
		return analysisedProject;
	}

	public void setAnalysisedProject(Set<AnalysisProject> analysisedProject) {
		this.analysisedProject = analysisedProject;
	}

	public Set<QualityControl> getQualityControlSet() {
		return qualityControlSet;
	}

	public void setQualityControlSet(Set<QualityControl> qualityControlSet) {
		this.qualityControlSet = qualityControlSet;
	}

	public Date getQualityControlDate() {
		return QualityControlDate;
	}

	public void setQualityControlDate(Date qualityControlDate) {
		QualityControlDate = qualityControlDate;
	}

	public User getQualityControlUser() {
		return QualityControlUser;
	}

	public void setQualityControlUser(User qualityControlUser) {
		QualityControlUser = qualityControlUser;
	}

	public RecordAudit getRecordAudit() {
		return recordAudit;
	}

	public void setRecordAudit(RecordAudit recordAudit) {
		this.recordAudit = recordAudit;
	}

	public Set<Report> getReportSet() {
		return reportSet;
	}

	public void setReportSet(Set<Report> reportSet) {
		this.reportSet = reportSet;
	}

	public Set<NonSelfSendSample> getNonSelfSendSampleInfo() {
		return nonSelfSendSampleInfo;
	}

	public void setNonSelfSendSampleInfo(
			Set<NonSelfSendSample> nonSelfSendSampleInfo) {
		this.nonSelfSendSampleInfo = nonSelfSendSampleInfo;
	}

	public Set<ContractChange> getContractChange() {
		return contractChange;
	}

	public void setContractChange(Set<ContractChange> contractChange) {
		this.contractChange = contractChange;
	}

	public Set<Delivery_SampleType> getSampleTypeSet() {
		return sampleTypeSet;
	}

	public void setSampleTypeSet(Set<Delivery_SampleType> sampleTypeSet) {
		this.sampleTypeSet = sampleTypeSet;
	}
	

}
