package com.boncontact.base;

import java.lang.reflect.ParameterizedType;
import javax.annotation.Resource;

import com.boncontact.domain.AuthSignator;
import com.boncontact.service.AnalysisCategoryService;
import com.boncontact.service.AnalysisFrequencyService;
import com.boncontact.service.AnalysisProjectService;
import com.boncontact.service.AnalysisTypeService;
import com.boncontact.service.AuthSignatorService;
import com.boncontact.service.BusinessRegistrationService;
import com.boncontact.service.CommonTempletService;
import com.boncontact.service.ContractAuditService;
import com.boncontact.service.ContractChangeService;
import com.boncontact.service.ContractMonitoringItemService;
import com.boncontact.service.CustomerService;
import com.boncontact.service.DeliveryReceitpService;
import com.boncontact.service.DepartmentService;
import com.boncontact.service.DeviceService;
import com.boncontact.service.EncodeService;
import com.boncontact.service.FeedBackService;
import com.boncontact.service.HistoryLoginService;
import com.boncontact.service.InspectionSheetService;
import com.boncontact.service.InspectionSheet_ResultService;
import com.boncontact.service.InventoryService;
import com.boncontact.service.MessageListenService;
import com.boncontact.service.MessageQueueService;
import com.boncontact.service.NonSelfSendSampleService;
import com.boncontact.service.NoticeService;
import com.boncontact.service.OriginalRecordService;
import com.boncontact.service.PowerService;
import com.boncontact.service.ProjectService;
import com.boncontact.service.QualityControlService;
import com.boncontact.service.ReportService;
import com.boncontact.service.RoleService;
import com.boncontact.service.SelfSendSampleInfoService;
import com.boncontact.service.ServiceContractService;
import com.boncontact.service.TrafficContractService;
import com.boncontact.service.UserService;
import com.boncontact.util.PropertiesUtlis;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public abstract class BaseAction<T> extends ActionSupport implements
		ModelDriven<T> {
	private static final long serialVersionUID = 7016596636244395063L;
	protected T model;
	protected int pageRowCount = Integer.parseInt(PropertiesUtlis.getValue(
			"/setting.properties", "rows"));

	@SuppressWarnings("unchecked")
	public BaseAction() {
		try {
			ParameterizedType pt = (ParameterizedType) this.getClass()
					.getGenericSuperclass();
			Class<T> clazz = (Class<T>) pt.getActualTypeArguments()[0];
			model = clazz.newInstance();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public T getModel() {
		return model;
	}

	@Resource
	protected RoleService roleService;
	@Resource
	protected UserService userService;
	@Resource
	protected CustomerService customerService;
	@Resource
	protected DeviceService deviceService;
	@Resource
	protected InventoryService inventoryService;
	@Resource
	protected DepartmentService departmentService;
	@Resource
	protected ContractMonitoringItemService contractMonitoringItemService;
	@Resource
	protected TrafficContractService trafficContractService;
	@Resource
	protected ProjectService projectService;
	@Resource
	protected EncodeService encodeService;
	@Resource
	protected ServiceContractService serviceContractService;
	@Resource
	protected BusinessRegistrationService businessRegistrationService;
	@Resource
	protected CommonTempletService commonTempletService;
	@Resource
	protected SelfSendSampleInfoService selfSendSampleInfoService;
	@Resource
	protected DeliveryReceitpService deliveryReceitpService;
	@Resource
	protected AnalysisProjectService analysisProjectService;
	@Resource
	protected InspectionSheetService inspectionSheetService;
	@Resource
	protected QualityControlService qualityControlService;
	@Resource
	protected InspectionSheet_ResultService inspectionSheet_ResultService;
	@Resource
	protected ReportService reportService;
	@Resource
	protected HistoryLoginService historyLoginService;
	@Resource
	protected NoticeService noticeService;
	@Resource
	protected NonSelfSendSampleService nonSelfSendSampleService;
	@Resource
	protected ContractChangeService contractChangeService;
	@Resource
	protected FeedBackService feedBackService;
	@Resource
	protected ContractAuditService contractAuditService;
	@Resource
	protected PowerService powerService;
	@Resource
	protected AnalysisTypeService analysisTypeService;
	@Resource
	protected MessageQueueService messageQueueService;
	@Resource
	protected MessageListenService messageListenService;
	@Resource
	protected AnalysisCategoryService analysisCategoryService;
	@Resource
	protected AnalysisFrequencyService analysisFrequencyService;
	@Resource
	protected OriginalRecordService originalRecordService;
	@Resource
	protected AuthSignatorService authSignatorService;
}
