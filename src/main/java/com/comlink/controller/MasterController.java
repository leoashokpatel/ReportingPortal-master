package com.comlink.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.comlink.dao.AddnumDao;
import com.comlink.dao.ReportDAO;
import com.comlink.dao.UserDao;
import com.comlink.dao.impl.ReportDaoImpl;
import com.comlink.model.Addnum;
import com.comlink.model.SummaryReport;
import com.comlink.model.TestFileLog;
import com.comlink.model.TestNumberCDR;
import com.comlink.model.User;

@Controller
@RequestMapping("*")
@Scope("session")
public class MasterController {

	@Autowired
	private UserDao userDAO;

	@Autowired
	private ReportDAO reportDAO;

	@Autowired
	private AddnumDao addnumdao;

	public UserDao getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDao userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap model) {
		return "login";
	}

	public static HashMap<String, String> map = new HashMap<String, String>();

	//Summary Report
	@RequestMapping(value = "/downloadsummaryReport", method = RequestMethod.GET)
	public void downloadExcel(ModelMap model, HttpServletRequest request, HttpServletResponse response)
			throws ParseException {
		
		
		HttpSession session = request.getSession();
		String sessionID = map.get("sessionId");
		if (session !=null) {

			String sdate = request.getParameter("startdate");
			String edate = request.getParameter("enddate");
			SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");

			java.util.Date dates = df.parse(sdate);
			java.util.Date datee = df.parse(edate);

			java.sql.Date sqlDates = new java.sql.Date(dates.getTime());
			java.sql.Date sqlDatee = new java.sql.Date(datee.getTime());

			String focusedInput = request.getParameter("focusedInput");
			String RequestSource = request.getParameter("Request-Source");
			String carrierroute = request.getParameter("carrier-route");
			String optionsRadios = request.getParameter("optionsRadios");
			String[] typetest=request.getParameterValues("type-test");

			if (!RequestSource.isEmpty() || !carrierroute.isEmpty() || !optionsRadios.isEmpty())
			{
				try {

					List<TestFileLog> downloadreportlist = reportDAO.downloadsummaryReport(sqlDates, sqlDatee,
							focusedInput, RequestSource, carrierroute, optionsRadios,
							typetest);

			      
			        response.setContentType("application/vnd.ms-excel");
					response.setHeader("Content-Disposition", "attachment; filename=SummaryReport.xls");   
			       
					HSSFWorkbook workbook = new HSSFWorkbook();
					HSSFSheet sheet = workbook.createSheet("TestNumberCDR");
					int rowIndex = 0;
					Row rowheader = sheet.createRow(rowIndex++);
					rowheader.createCell(0).setCellValue("RecordID");
					rowheader.createCell(1).setCellValue("Testplan id");
					rowheader.createCell(2).setCellValue("Request id");
					rowheader.createCell(3).setCellValue("Test name");
					rowheader.createCell(4).setCellValue("Test file name");
					rowheader.createCell(5).setCellValue("Test Requested By");
					rowheader.createCell(6).setCellValue("File rcvd at");
					rowheader.createCell(7).setCellValue("File sent to_proc");
					rowheader.createCell(8).setCellValue("File Completed");
					rowheader.createCell(9).setCellValue("Test Duration");
					rowheader.createCell(10).setCellValue("Test Type");
					rowheader.createCell(11).setCellValue("No calls_req");
					rowheader.createCell(12).setCellValue("No calls_proc");
					rowheader.createCell(13).setCellValue("Country Name");
					rowheader.createCell(14).setCellValue("Country Code");
					rowheader.createCell(15).setCellValue("Start Range");
					rowheader.createCell(16).setCellValue("Carrier Spec");
					rowheader.createCell(17).setCellValue("Route Id");
					rowheader.createCell(18).setCellValue("Report Type");
					rowheader.createCell(19).setCellValue("Test Status");
					rowheader.createCell(20).setCellValue("Test Code");
					rowheader.createCell(21).setCellValue("Successful Calls");
					rowheader.createCell(22).setCellValue("Failed Calls");
					rowheader.createCell(23).setCellValue("test_code_desc");

					for (TestFileLog report : downloadreportlist) {
						Row row = sheet.createRow(rowIndex++);
						row.createCell(0).setCellValue(report.getRecordID());
						row.createCell(1).setCellValue(report.getTestPlanId());
						row.createCell(2).setCellValue(report.getRequestId());
						row.createCell(3).setCellValue(report.getTestName());
						row.createCell(4).setCellValue(report.getTestFileName());
						row.createCell(5).setCellValue(report.getTestRequestedBy());
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						row.createCell(6).setCellValue(format.format(report.getFileRcvdAt()));
						row.createCell(7).setCellValue(format.format(report.getFileSentToProc()));
						row.createCell(8).setCellValue(format.format(report.getFileCompleted()));
						row.createCell(9).setCellValue((report.getTestDuration() / 1000.0f));
						row.createCell(10).setCellValue(report.getTestType());
						row.createCell(11).setCellValue(report.getNbrOfCallsReq());
						row.createCell(12).setCellValue(report.getNbrOfCallsProc());
						row.createCell(13).setCellValue(report.getCountryName());
						row.createCell(14).setCellValue(report.getCountryCode());
						row.createCell(15).setCellValue(report.getStartRange());
						row.createCell(16).setCellValue(report.getCarrierSpec());
						row.createCell(17).setCellValue(report.getRouteId());
						row.createCell(18).setCellValue(report.getReportType());
						row.createCell(19).setCellValue(report.getTestStatus());
						row.createCell(20).setCellValue(report.getTestCode());
						row.createCell(21).setCellValue(report.getSuccessfulCalls());
						row.createCell(22).setCellValue(report.getFailedCalls());
						row.createCell(23).setCellValue(report.getTest_code_desc());
					}
					workbook.write(response.getOutputStream());
					workbook.close();
			   
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	
	//downloadDetailsReport
	@RequestMapping(value = "/downloadDetailsReport", method = RequestMethod.GET)
	public void downloadDetailsReport(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession(false);		
		String sessionID = map.get("sessionId");	

		if (session !=null) {
			try {
				SummaryReport summaryReport = new SummaryReport();
				TestFileLog testfilelog = new TestFileLog();

				String sdate = request.getParameter("startdate");
				String edate = request.getParameter("enddate");
				SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
				java.util.Date dates = df.parse(sdate);
				java.util.Date datee = df.parse(edate);
				java.sql.Date sqlDates = new java.sql.Date(dates.getTime());
				java.sql.Date sqlDatee = new java.sql.Date(datee.getTime());
				summaryReport.setStartdate(sqlDates);
				summaryReport.setEnddate(sqlDatee);
				String focusedInput = request.getParameter("focusedInput");
				String RequestSource = request.getParameter("Request-Source");
				String carrierroute = request.getParameter("carrier-route");
				String optionsRadios = request.getParameter("optionsRadios");

				List<TestNumberCDR> downloadreportlist = reportDAO.downloadDetailReport(sqlDates, sqlDatee,
						focusedInput, RequestSource, carrierroute, optionsRadios,
						request.getParameterValues("type-test"), testfilelog);
          
	            response.setContentType("application/vnd.ms-excel");
	            response.setHeader("Content-Disposition", "attachment; filename=Testview.xls");
				HSSFWorkbook workbook = new HSSFWorkbook();
				HSSFSheet sheet = workbook.createSheet("TestFileLog");
				int rowIndex = 0;
				Row rowheader = sheet.createRow(rowIndex++);
				rowheader.createCell(0).setCellValue("RecordID");
				rowheader.createCell(1).setCellValue("testfilelogID");
				rowheader.createCell(2).setCellValue("test plan id");
				rowheader.createCell(3).setCellValue("request id");
				rowheader.createCell(4).setCellValue("country code");
				rowheader.createCell(5).setCellValue("carrier prefix");
				rowheader.createCell(6).setCellValue("number dial");
				rowheader.createCell(7).setCellValue("call start");
				rowheader.createCell(8).setCellValue("call answer");
				rowheader.createCell(9).setCellValue("call end");
				rowheader.createCell(10).setCellValue("test type");
				rowheader.createCell(11).setCellValue("origin call id");
				rowheader.createCell(12).setCellValue("termination call id");
				rowheader.createCell(13).setCellValue("sip_termination status");
				rowheader.createCell(14).setCellValue("caller uri");
				rowheader.createCell(15).setCellValue("called uri");
				rowheader.createCell(16).setCellValue("qos value");

				for (TestNumberCDR report : downloadreportlist) {
					System.out.println("report===no=="+report.getRecordID());
					Row row = sheet.createRow(rowIndex++);
					row.createCell(0).setCellValue(report.getRecordID());
					row.createCell(1).setCellValue(report.getTestfilelogID());
					row.createCell(2).setCellValue(report.getTestPlanId());
					row.createCell(3).setCellValue(report.getRequestId());
					row.createCell(4).setCellValue(report.getCountryCode());
					row.createCell(5).setCellValue(report.getCarrierPrefix());
					row.createCell(6).setCellValue(report.getNumberDial());
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					row.createCell(7).setCellValue(format.format(report.getCallStart()));
					row.createCell(8).setCellValue(format.format(report.getCallAnswer()));
					row.createCell(9).setCellValue(format.format(report.getCallEnd()));
					row.createCell(10).setCellValue(report.getTestType());
					row.createCell(11).setCellValue(report.getOriginCallId());
					row.createCell(12).setCellValue(report.getTerminationCallId());
					row.createCell(13).setCellValue(report.getSip_terminationStatus());
					row.createCell(14).setCellValue(report.getCallerUri());
					row.createCell(15).setCellValue(report.getCalledUri());
					row.createCell(16).setCellValue(report.getQosValue());
				}
				workbook.write(response.getOutputStream());
				workbook.close();
				response.getOutputStream().flush();
				response.getOutputStream().close();
               
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}
    @RequestMapping(value = "/getSearchResult", method = RequestMethod.GET)
	public ModelAndView subrecord(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		ModelAndView modelview = new ModelAndView();
		List<TestNumberCDR> testnumbercdr = reportDAO.getTestNumberCDR(id);

		modelview.setViewName("Name: TestNumberCDR");
		modelview.addObject("message", "Login Fetched.");

		modelview.addObject("TestNumberCDR", testnumbercdr);

		return modelview;
	}

	@RequestMapping(value = "/getSearchResult", method = RequestMethod.POST)
	public ModelAndView subrecord(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		request.getParameter("data");
		int id = Integer.parseInt(request.getParameter("id"));

		ModelAndView modelview = new ModelAndView();
		List<TestNumberCDR> testnumbercdr = reportDAO.getTestNumberCDR(id);

		modelview.setViewName("Name: TestNumberCDR");
		modelview.addObject("message", "Login Fetched.");

		modelview.addObject("TestNumberCDR", testnumbercdr);

		return modelview;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginget(ModelMap model) {
		return "login";

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String sessionId = null;
		SimpleDateFormat date = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		ModelAndView modelview = new ModelAndView();

		User user = userDAO.login(username, password);
		if (user != null) {

			Calendar now = Calendar.getInstance();
			modelview.addObject("edate", date.format(now.getTime()));
			now.set(Calendar.HOUR, 0);
			now.set(Calendar.MINUTE, 0);
			now.set(Calendar.SECOND, 0);
			now.set(Calendar.HOUR_OF_DAY, 0);
			HttpSession sessionn = request.getSession();
			sessionId = sessionn.getId();
			map.put("sessionId", sessionId);
			map.put("userID", user.getId());
			map.put("userType", user.getType());
			modelview.setViewName("summary-report");
			modelview.addObject(" ", "Login Successfully.");
			modelview.addObject("type", user.getType());
			modelview.addObject("id", user.getId());
			modelview.addObject("sdate", date.format(now.getTime()));
		} else {
			modelview.setViewName("login");
			modelview.addObject("message", "Invalid username or password");
		}
		return modelview;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		map.remove("sessionId");
		return "login";
	}

	@RequestMapping(value = "/addAccount", method = RequestMethod.GET)
	public String singupget(ModelMap model) {
		return "sign-up";
	}

	@RequestMapping(value = "/addAccount", method = RequestMethod.POST)
	public ModelAndView singup(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		User user = new User();
		user.setFirstName(request.getParameter("first-name"));
		user.setLastName(request.getParameter("Last-name"));
		user.setUserName(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setType(request.getParameter("acctype"));
		ModelAndView modelview = new ModelAndView();
		if (userDAO.registerUser(user) == 1) {
			modelview.setViewName("login");
			modelview.addObject("message", "Register Successfully.");
		} else {
			modelview.setViewName("sign-up");
			modelview.addObject("message", "Please Try Again");
		}
		return modelview;
	}

	@RequestMapping(value = "/changepassword", method = RequestMethod.GET)
	public String editAccountget(ModelMap model, HttpServletRequest request) {
		return "changepassword";
	}

	@RequestMapping(value = "/changepassword", method = RequestMethod.POST)
	public ModelAndView editAccountpost(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelview = new ModelAndView();
		HttpSession session = request.getSession(false);
		User user = new User();
		String userID = map.get("userID");
		if (userID != null) {
			user = userDAO.getUserById(userID);
		}
		if (userDAO.updateUser(user.getId(), request.getParameter("password")) == 1) {
			modelview.setViewName("summary-report");
			modelview.addObject("message", "Password Changed Successfully.");
			modelview.addObject("type", user.getType());
			modelview.addObject("id", user.getId());
		} else {
			modelview.setViewName("summary-report");
			modelview.addObject("message", "Please Try Again");
		}
		return modelview;
	}

	@RequestMapping(value = "/summary-report", method = RequestMethod.GET)
	public ModelAndView summaryreportget(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelview = new ModelAndView();
		HttpSession session = request.getSession();
		String value = session.getId();
		String sessionID = map.get("sessionId");
		SimpleDateFormat date = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Calendar now = Calendar.getInstance();
		modelview.addObject("edate", date.format(now.getTime()));
		now.set(Calendar.HOUR, 0);
		now.set(Calendar.MINUTE, 0);
		now.set(Calendar.SECOND, 0);
		now.set(Calendar.HOUR_OF_DAY, 0);
		modelview.addObject("sdate", date.format(now.getTime()));
		if (session !=null) {
			User user = new User();
			String userID = map.get("userID");
			if (userID != null) {
				user = userDAO.getUserById(userID);
			}
			modelview.addObject("type", user.getType());
			modelview.setViewName("summary-report");
			return modelview;
		} else {
			modelview.setViewName("login");
			return modelview;
		}
	}

	@RequestMapping(value = "/summary-report", method = RequestMethod.POST)
	public ModelAndView summaryreport(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelview = new ModelAndView();
		ReportDaoImpl impl=new ReportDaoImpl();
		HttpSession session = request.getSession();
		if (session !=null) {
			try {
				User user = new User();
				String userID = map.get("userID");
				if (userID != null) {
					user = userDAO.getUserById(userID);
				}
				SummaryReport summaryReport = new SummaryReport();
				TestFileLog testfilelog = new TestFileLog();
				String sdate = request.getParameter("startdate");
				String edate = request.getParameter("enddate");
				System.out.println(sdate+"date"+edate);
				modelview.addObject("focusedInput", request.getParameter("focusedInput"));

				modelview.addObject("RequestSource", request.getParameter("Request-Source"));

				modelview.addObject("carrierroute", request.getParameter("carrier-route"));

				modelview.addObject("optionsRadios", request.getParameter("optionsRadios"));
				if (!sdate.equals("") && !edate.equals("")) {

					SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");

					java.util.Date dates = df.parse(sdate);
					java.util.Date datee = df.parse(edate);

					java.sql.Date sqlDates = new java.sql.Date(dates.getTime());
					java.sql.Date sqlDatee = new java.sql.Date(datee.getTime());

					summaryReport.setStartdate(sqlDates);
					summaryReport.setEnddate(sqlDatee);
					modelview.addObject("sdate", sdate);
					modelview.addObject("edate", edate);

				} else {
					SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
					java.util.Date startdate = new Date();
					Calendar cal = Calendar.getInstance();
					cal.setTime(startdate);
					cal.set(Calendar.HOUR_OF_DAY, 0);
					cal.set(Calendar.HOUR, 0);
					cal.set(Calendar.MINUTE, 0);
					cal.set(Calendar.SECOND, 0);
					long time = cal.getTimeInMillis() - (21600000 + 1800000);

					java.sql.Date sqlDates = new java.sql.Date(time);
					java.sql.Date sqlDatee = new java.sql.Date(time);

					summaryReport.setStartdate(sqlDates);
					summaryReport.setEnddate(sqlDatee);
					modelview.addObject("sdate", sdate);
					modelview.addObject("edate", edate);
				}

				if ((request.getParameter("focusedInput").length() != 0)
						&& (request.getParameter("focusedInput") != null)
						&& (!("".equals(request.getParameter("focusedInput").trim()))
								))
					if
					(request.getParameter("focusedInput").matches(".*\\D.*") == false)
					{
						summaryReport.setTicketNumber(Integer.valueOf(request.getParameter("focusedInput")));

					}
					else
					{
						modelview.addObject("message", "Ticket Number Must Be Integer.");
				
					}

				else

					
				modelview.setViewName("summary-report");

				// summaryReport.setTicketNumber(0);

				if ((request.getParameter("Request-Source").length() != 0)
						&& (request.getParameter("Request-Source") != null)
						&& (!("".equals(request.getParameter("Request-Source").trim()))))
					summaryReport.setRequestSource(request.getParameter("Request-Source"));
				else
					summaryReport.setRequestSource(null);

				if ((request.getParameter("carrier-route").length() != 0)
						&& (request.getParameter("carrier-route") != null)
						&& (!("".equals(request.getParameter("carrier-route").trim()))))
					summaryReport.setCarrierRoute(request.getParameter("carrier-route"));
				else
					summaryReport.setCarrierRoute(null);

				if (request.getParameterValues("type-test") instanceof String[]) {
					summaryReport.setTypeTest(request.getParameterValues("type-test"));
					String typetest[] = request.getParameterValues("type-test");
					List<String> cvalues = Arrays.asList(typetest);
					modelview.addObject("typetest", cvalues);
					modelview.addObject("type", user.getType());
					modelview.addObject("id", user.getId());
				} else
					summaryReport.setTypeTest(null);

				if ((!request.getParameter("optionsRadios").equalsIgnoreCase("ALL"))
						&& (request.getParameter("optionsRadios").length() != 0)
						&& (request.getParameter("optionsRadios") != null)
						&& (!("".equals(request.getParameter("optionsRadios").trim()))))
					summaryReport.setOptionsRadios(request.getParameter("optionsRadios"));
				else
					summaryReport.setOptionsRadios(null);
				
				String pageNumber =(String) request.getParameter("pagenum"); 

				
				int total=Integer.parseInt(request.getParameter("page"));
				
				int pageNum = 0;
				int pageTotalEntries = 0;
				int total1=0;
				
			    if(pageNumber != null && !"".equals(pageNumber)){
					pageNum =  Integer.parseInt(pageNumber);
					pageTotalEntries = pageNum+1;
					
					if(pageNum !=0)
					{
						pageNum = pageNum *total;
					
						
					}
					
				} else {
					pageNum =  0;
				} 
				
			   
			  String list=reportDAO.getRecordsByPage(summaryReport,pageNum, total);
			  int totalRecord = impl.totallist.size();
			  if(totalRecord == 0){
				  pageNum =0;
			    } else {
			    	pageNum= pageNum +1;
			    }
			  if(pageTotalEntries ==0){
				  pageTotalEntries =1;
			  }
			  if(totalRecord == 0 && pageNum ==0){
				  pageTotalEntries=0;
			  } 
			  
			  
			  int totalofRecords=total*pageTotalEntries;
			  
			  if(totalofRecords >totalRecord){
				  totalofRecords = totalRecord;
			  }
			 
				modelview.setViewName("summary-report");
				
				String[] numberand = list.split("SEPERATOR");

				modelview.addObject("testlog", numberand[0]);
 
				modelview.addObject("numpages", numberand[1]); 
 
				modelview.addObject("selectedPage", pageNumber); 
 
				modelview.addObject("pageSize",total); 
				modelview.addObject("message1", "showing  "  +(pageNum)+ " to  "  +totalofRecords+ " of  "  +totalRecord+ " entries" );
				System.out.println("total"+total);

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return modelview;
		} else {
			modelview.setViewName("login");
			return modelview;
		}

	}

	@RequestMapping(value = "/user-management", method = RequestMethod.GET)
	public ModelAndView userManagement(@RequestParam("id") String id1, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView modelview = new ModelAndView();
		HttpSession session = request.getSession();
		String action = null;
		if (id1 != "") {

		int user2=userDAO.deleteUser(id1);
			if (user2 == -1) {

				modelview.addObject("message", "User  not Deleted");
				modelview.setViewName("user-management");
			} else {
				modelview.addObject("message", "User  Deleted Successfully..");
				modelview.setViewName("user-management");
			}
			

		}
		
		if (session !=null) {	 
			if (request.getParameter("action") != null) {
				action = request.getParameter("action");

				if (action.equals("edit")) {
					String id = request.getParameter("userID");
					String firstName = request.getParameter("firstname");
					String lastName = request.getParameter("lastname");
					String userName = request.getParameter("username");
					String type = request.getParameter("type");
					User user = new User();
					if (id != null) {
						user = userDAO.getUserById(id);
						user.setFirstName(firstName);
						user.setLastName(lastName);
						user.setType(type);
						user.setUserName(userName);
						userDAO.editUser(user);
					}

				}
				if (action.equals("add"))
				{

					User user = new User();
					user.setFirstName(request.getParameter("firstname"));
					user.setLastName(request.getParameter("lastname"));
					user.setUserName(request.getParameter("username"));
					user.setPassword(request.getParameter("password"));
					user.setType(request.getParameter("acctype"));
					userDAO.registerUser(user);

				}
			}

			User user = new User();
			String userID = map.get("userID");
			if (userID != null) {
				user = userDAO.getUserById(userID);

			}
			List<User> user1 = userDAO.getAllUser();
			modelview.addObject("type", user.getType());
			modelview.addObject("userList", user1);
			modelview.addObject("userID", user.getId());
			modelview.setViewName("user-management");
			return modelview;
		} else {
			modelview.setViewName("login");
			return modelview;
		}
	}

	@RequestMapping(value = "/user-management", method = RequestMethod.POST)
	public ModelAndView UserManagement(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		ModelAndView modelview = new ModelAndView();
		HttpSession session = request.getSession();
		String value = session.getId();
		String sessionID = map.get("sessionId");
		String action = null;
		if (session !=null) {	 
			if (request.getParameter("action") != null) {
				action = request.getParameter("action");

				if (action.equals("edit")) {
					String id = request.getParameter("userID");
					String firstName = request.getParameter("firstname");
					String lastName = request.getParameter("lastname");
					String userName = request.getParameter("username");
					String type = request.getParameter("type");
					User user = new User();
					if (id != null) {
						user = userDAO.getUserById(id);
						user.setFirstName(firstName);
						user.setLastName(lastName);
						user.setType(type);
						user.setUserName(userName);
						int user2=userDAO.editUser(user);
						if (user2 == -1) {

							modelview.addObject("message", "User not updated");
							modelview.setViewName("user-management");
						} else {
							modelview.addObject("message", "User Updated Successfully..");
							modelview.setViewName("user-management");
						}
					}

				}
				if (action.equals("add")) {
					User user = new User();
					user.setFirstName(request.getParameter("firstname"));
					user.setLastName(request.getParameter("lastname"));
					user.setUserName(request.getParameter("username"));
					user.setType(request.getParameter("acctype"));
					user.setPassword(request.getParameter("password"));
					int user1 = userDAO.registerUser(user);

					if (user1 == -1) {

						modelview.addObject("message", "Username Must Be Unique");
						modelview.setViewName("user-management");
					} else {
						modelview.addObject("message", "User Created Successfully..");
						modelview.setViewName("user-management");
					}

				}
			}

			User user = new User();
			String userID = map.get("userID");
			if (userID != null) {
				user = userDAO.getUserById(userID);

			}
			List<User> user1 = userDAO.getAllUser();
			modelview.addObject("userID", user.getId());
			modelview.addObject("userList", user1);
			modelview.setViewName("user-management");
			return modelview;
		} else {
			modelview.setViewName("login");
			return modelview;
		}
	}

	@RequestMapping(value = "/deleteUser")
	public String deleteParentList(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		return "user-management";
	}

	public HashMap<String, String> getHashmap() {
		return map;
	}

	@RequestMapping(value = "/addnum", method = RequestMethod.GET)
	public ModelAndView addnum(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelview = new ModelAndView();
		HttpSession session = request.getSession();
		String value = session.getId();
		String sessionID = map.get("sessionId");

		modelview.setViewName("addnum");
		return modelview;

	}

	@RequestMapping(value = "/addnum", method = RequestMethod.POST)
	public ModelAndView addnum(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		ModelAndView modelview = new ModelAndView();
		HttpSession session = request.getSession();
		if (session !=null) {	 
			Addnum add = new Addnum();
			add.setCompanyName(request.getParameter("company"));
			add.setCountryName(request.getParameter("country"));
			add.setNum(request.getParameter("number"));
			add.setFax_answer(request.getParameter("type-test"));


		int sd=	addnumdao.registernum(add);
		if(sd==1)
		{
			modelview.addObject("message", "Number Added Successfully.");
			modelview.setViewName("addnum");
		}
		else
		{
			modelview.addObject("message", "Number Not Added, Please Try Again.");
			modelview.setViewName("addnum");
		}
		}
		return modelview;
	}
}