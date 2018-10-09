package com.comlink.dao.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import com.comlink.dao.ReportDAO;
import com.comlink.model.SummaryReport;
import com.comlink.model.TestFileLog;
import com.comlink.model.TestNumberCDR;
import com.comlink.rowmapper.TestFileLogrowMapper;
import com.comlink.rowmapper.TestNumberCDRMapper;

public class ReportDaoImpl implements ReportDAO {

	private JdbcTemplate jdbcTemplate;
	private DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	public static List<TestFileLog> totallist;

	// getSummaryReport
	
	public String getSummaryReport(SummaryReport summeryReport) {
		
		String op = "";

		long starttime = summeryReport.getStartdate().getTime();
		long endtime = summeryReport.getEnddate().getTime();

		try {
			String querystr = "select * from testfilelog where ";

			if (summeryReport.getOptionsRadios() != null && summeryReport.getOptionsRadios().length() != 0) {
				querystr = querystr + " test_status = '" + summeryReport.getOptionsRadios() + "' AND ";
			}

			if (summeryReport.getTicketNumber() != 0) {
				querystr = querystr + " request_id = '" + summeryReport.getTicketNumber() + "' AND ";
			}

			if (summeryReport.getRequestSource() != null && summeryReport.getRequestSource().length() != 0) {
				querystr = querystr + " test_requested_by LIKE '" + summeryReport.getRequestSource() + "%' AND ";
			}

			if (summeryReport.getTypeTest() != null && summeryReport.getTypeTest().length != 0) {
				querystr = querystr + " ( ";
				for (int i = 0; i < summeryReport.getTypeTest().length; i++) {
					String type[] = summeryReport.getTypeTest();
					String t = type[i];
					if (i == summeryReport.getTypeTest().length - 1) {
						querystr = querystr + " test_type = '" + t + "'";
					} else
						querystr = querystr + " test_type = '" + t + "' OR ";
				}

				querystr = querystr + " ) " + " AND ";

			}

			if (summeryReport.getCarrierRoute() != null && summeryReport.getCarrierRoute().length() != 0) {
				querystr = querystr + " carrier_spec LIKE '" + summeryReport.getCarrierRoute() + "%' AND ";
			}
			querystr = querystr + " file_rcvd_at BETWEEN " + starttime + " AND " + endtime;


			List<TestFileLog> list = jdbcTemplate.query(querystr, new TestFileLogrowMapper());
			op = "";
			for (int i = 0; i < list.size(); i++) {

				op = op + "<tr data-toggle='collapse' data-target='#demo" + i
						+ "' class='accordion-toggle' aria-expanded='false'>";
				op = op + "				<td><button class='btn btn-default btn-xs'><i class='fa-icon-eye-open'></i></button></td>";
				op = op + "				<td>" + list.get(i).getRecordID() + "</td>";
				op = op + "				<td>" + list.get(i).getTestPlanId() + "</td>";
				op = op + "				<td>" + list.get(i).getRequestId() + "</td>";
				op = op + "				<td>" + list.get(i).getTestName() + "</td>";
				op = op + "				<td>" + list.get(i).getTestFileName() + "</td>";
				op = op + "				<td>" + list.get(i).getTestRequestedBy() + "</td>";
				op = op + "	<td style='white-space: nowrap;'>"
						+ format.format(new Date(Long.valueOf(list.get(i).getFileRcvdAt()))) + "</td>";
				op = op + "	<td style='white-space: nowrap;'>"
						+ format.format(new Date(Long.valueOf(list.get(i).getFileSentToProc()))) + "</td>";
				op = op + "	<td style='white-space: nowrap;'>"
						+ format.format(new Date(Long.valueOf(list.get(i).getFileCompleted()))) + "</td>";
				op = op + "	<td>" + (list.get(i).getTestDuration() / 1000.0f) + "</td>";
				op = op + "				<td>" + list.get(i).getTestType() + "</td>";
				op = op + "				<td>" + list.get(i).getNbrOfCallsReq() + "</td>";
				op = op + "				<td>" + list.get(i).getNbrOfCallsProc() + "</td>";
				op = op + "				<td>" + list.get(i).getCountryName() + "</td>";
				op = op + "				<td>" + list.get(i).getCountryCode() + "</td>";
				op = op + "				<td>" + list.get(i).getStartRange() + "</td>";
				op = op + "				<td>" + list.get(i).getCarrierSpec() + "</td>";
				op = op + "				<td>" + list.get(i).getRouteId() + "</td>";
				op = op + "				<td>" + list.get(i).getReportType() + "</td>";
				op = op + "				<td>" + list.get(i).getTestStatus() + "</td>";
				op = op + "				<td>" + list.get(i).getTestCode() + "</td>";
				op = op + "				<td>" + list.get(i).getSuccessfulCalls() + "</td>";
				op = op + "				<td>" + list.get(i).getFailedCalls() + "</td>";
				op = op + "				<td>" + list.get(i).getTest_code_desc() + "</td>";
				op = op + "				</tr>";
				op = op + "				<tr>";

				op = op + "    <td colspan='12' class='hiddenRow'><div class='accordian-body collapse' id='demo" + i
						+ "' aria-expanded='true'> ";
				op = op + "    <table class='table table-striped border-all' style='border:1px solid #ccc;'>";
				op = op + "    <thead>";
				op = op + "    <tr>";
				op = op + "    <th>RecordID</th>";
				op = op + "    <th>Testfilelog ID</th>";
				op = op + "    <th>Test Plan Id</th>";
				op = op + "    <th>Ticket Number</th>";
				op = op + "    <th>Country Code</th>";
				op = op + "    <th>Carrier Prefix</th>";
				op = op + "    <th>Number Dial</th>";
				op = op + "    <th>Call Start</th>";
				op = op + "    <th>Call Answer</th>";
				op = op + "    <th>Call End</th>";
				op = op + "    <th>Test Type</th>";
				op = op + "    <th>Origin Call Id</th>";
				op = op + "    <th>Termination Call Id</th>";
				op = op + "    <th>Sip Termination Status</th>";
				op = op + "    <th>Caller Uri</th>";
				op = op + "    <th>Called Uri</th>";
				op = op + "    <th>Qosalue</th>";
				op = op + "  		</tr>";
				op = op + "    </thead>";
				op = op + "    <tbody>";

				String query2 = "select * from testnumbercdr where testfilelogID=" + list.get(i).getRecordID();
				List<TestNumberCDR> list2 = jdbcTemplate.query(query2, new TestNumberCDRMapper());
				for (int j = 0; j < list2.size(); j++) {
					op = op + "<tr>";
					op = op + "<td>" + list2.get(j).getRecordID() + "</td>";
					op = op + "<td>" + list2.get(j).getTestfilelogID() + "</td>";
					op = op + "<td>" + list2.get(j).getTestPlanId() + "</td>";
					op = op + "<td>" + list2.get(j).getRequestId() + "</td>";
					op = op + "<td>" + list2.get(j).getCountryCode() + "</td>";
					op = op + "<td>" + list2.get(j).getCarrierPrefix() + "</td>";
					op = op + "<td>" + list2.get(j).getNumberDial() + "</td>";
					op = op + "<td style='white-space: nowrap;'>"
							+ format.format(new Date(Long.valueOf(list2.get(j).getCallStart()))) + "</td>";
					op = op + "<td style='white-space: nowrap;'>"
							+ format.format(new Date(Long.valueOf(list2.get(j).getCallAnswer()))) + "</td>";
					op = op + "<td style='white-space: nowrap;'>"
							+ format.format(new Date(Long.valueOf(list2.get(j).getCallEnd()))) + "</td>";
					op = op + "<td>" + list2.get(j).getTestType() + "</td>";
					op = op + "<td>" + list2.get(j).getOriginCallId() + "</td>";
					op = op + "<td>" + list2.get(j).getTerminationCallId() + "</td>";
					op = op + "<td>" + list2.get(j).getSip_terminationStatus() + "</td>";
					op = op + "<td>" + list2.get(j).getCalledUri() + "</td>";
					op = op + "<td>" + list2.get(j).getCalledUri() + "</td>";
					op = op + "<td><a href='#' class='btn btn-default btn-sm'>";
					op = op + "<i class='glyphicon glyphicon-cog'>" + list2.get(j).getQosValue() + "</i></a></td>";
					op = op + "</tr>";
				}
				op = op + "</tbody>";
				op = op + "</table>";
				op = op + "</div> </td>";
				op = op + "</tr>";
			}

		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return op;
	}

	// Download Summary Report

	public List<TestFileLog> downloadsummaryReport(java.sql.Date sqlDates, java.sql.Date sqlDatee, String focusedInput,
			String RequestSource, String carrierroute, String optionsRadios, String[] type_test) {
		
		long starttime = sqlDates.getTime();
		long endtime = sqlDatee.getTime();

		String condition = "";
		if ((focusedInput != null) && (!focusedInput.isEmpty())) {
			condition = condition + "request_id like '%" + focusedInput + "%' AND ";

		}
		if ((RequestSource != null) && (!RequestSource.isEmpty())) {
			condition = condition + "test_requested_by  like '%" + RequestSource + "%' AND ";

		}
		if ((carrierroute != null) && (!carrierroute.isEmpty())) {
			condition = condition + "carrier_spec  like '%" + carrierroute + "%' AND ";

		}
		if ((optionsRadios != null) && (!optionsRadios.isEmpty()) && (!optionsRadios.equals("ALL"))) {
			condition = condition + "test_status ='" + optionsRadios + "' AND ";
		}

		
		if ((type_test != null) && (!(type_test.length == 0))) {
			if ((type_test.length == 1) && (type_test[0] != null) && (!type_test[0].isEmpty())) {
				System.out.println("type_test[0]==="+type_test[0]);
				String[] types=type_test[0].split(",");
				condition = condition + " ( ";
				for (int i = 0; i < types.length; i++) {
					String t = types[i];
					if ((t != null) && (!t.trim().isEmpty())) {
						if ((i == types.length - 1)) {
							condition = condition + " test_type = '" + t + "' ";
						} else
							condition = condition + " test_type = '" + t + "' OR ";
					}
				}
				condition = condition + " ) " + " AND ";
			}
		}
		condition = condition + "file_rcvd_at BETWEEN " + starttime + " AND " + endtime;
		String sql = "select * from testfilelog where " + condition;
	System.out.println(sql);
		List<TestFileLog> list = jdbcTemplate.query(sql, new TestFileLogrowMapper());
		
		return list;
	}

	// Details Reports
	
	public List<TestNumberCDR> downloadDetailReport(java.sql.Date sqlDates, java.sql.Date sqlDatee, String focusedInput,
			String RequestSource, String carrierroute, String optionsRadios, String[] type_test,
			TestFileLog testfilelog) {
		
		long starttime = sqlDates.getTime();
		long endtime = sqlDatee.getTime();

		String condition = "";
		if ((focusedInput != null) && (!focusedInput.isEmpty())) {
			condition = condition + "request_id like '%" + focusedInput + "%' AND ";

		}
		if ((RequestSource != null) && (!RequestSource.isEmpty()) ) {
			condition = condition + "test_requested_by  like '%" + RequestSource + "%' AND ";

		}
		if ((carrierroute != null) && (!carrierroute.isEmpty())) {
			condition = condition + "carrier_spec  like '%" + carrierroute + "%' AND ";

		}
		if ((optionsRadios != null) && (!optionsRadios.isEmpty()) && (!optionsRadios.equals("ALL"))) {
			condition = condition + "test_status ='" + optionsRadios + "' AND ";
		}

		if ((type_test != null) && (!(type_test.length == 0))) {
			if ((type_test.length == 1) && (type_test[0] != null) && (!type_test[0].isEmpty())) {
				System.out.println("type_test[0]==="+type_test[0]);
				String[] types=type_test[0].split(",");
				condition = condition + " ( ";
				for (int i = 0; i < types.length; i++) {
					String t = types[i];
					if ((t != null) && (!t.trim().isEmpty())) {
						if ((i == types.length - 1)) {
							condition = condition + " test_type = '" + t + "' ";
						} else
							condition = condition + " test_type = '" + t + "' OR ";
					}
				}
				condition = condition + " ) " + " AND ";
			}
		}
		condition = condition + "file_rcvd_at BETWEEN " + starttime + " AND " + endtime;
		String sql = "select * from testfilelog where " + condition;
	
		List<TestFileLog> list = jdbcTemplate.query(sql, new TestFileLogrowMapper());

		List<TestNumberCDR> listall = new ArrayList<TestNumberCDR>();
		for (TestFileLog testFileLog : list) {
			String query2 = "select * from testnumbercdr where testfilelogID=" + testFileLog.getRecordID();
			
			List<TestNumberCDR> list2 = jdbcTemplate.query(query2, new TestNumberCDRMapper());
			listall.addAll(list2);
		}
		
		return listall;
	}

	
	public List<TestNumberCDR> getTestNumberCDR(int testFileLogID) {
		return this.jdbcTemplate.query("call TestNumberCDR(?)", new TestNumberCDRMapper(), testFileLogID);
	}

	public String getRecordsByPage(SummaryReport summeryReport, int pageid,
			int total) {
		double divider = (double)total;
        String op = "";
		double numPages=0;
        long starttime = summeryReport.getStartdate().getTime();
        long endtime = summeryReport.getEnddate().getTime();
		
		try{
	         String querystr = "select * from testfilelog where ";

			if (summeryReport.getOptionsRadios() != null && summeryReport.getOptionsRadios().length() != 0) {
				querystr = querystr + " test_status = '" + summeryReport.getOptionsRadios() + "' AND ";
			}

			if (summeryReport.getTicketNumber() != 0) {
				querystr = querystr + " request_id = '" + summeryReport.getTicketNumber() + "' AND ";
			}

			if (summeryReport.getRequestSource() != null && summeryReport.getRequestSource().length() != 0) {
				querystr = querystr + " test_requested_by LIKE '" + summeryReport.getRequestSource() + "%' AND ";
			}

			if (summeryReport.getTypeTest() != null && summeryReport.getTypeTest().length != 0) {
				querystr = querystr + " ( ";
				for (int i = 0; i < summeryReport.getTypeTest().length; i++) {
					String type[] = summeryReport.getTypeTest();
					String t = type[i];
					if (i == summeryReport.getTypeTest().length - 1) {
						querystr = querystr + " test_type = '" + t + "'";
					} else
						querystr = querystr + " test_type = '" + t + "' OR ";
				}
				
				querystr = querystr + " ) " + " AND ";

			}

			if (summeryReport.getCarrierRoute() != null && summeryReport.getCarrierRoute().length() != 0) {
				querystr = querystr + " carrier_spec LIKE '" + summeryReport.getCarrierRoute() + "%' AND ";
			}
			 
     
			
			String querystrTotal =querystr;
			
			
			querystr = querystr + " file_rcvd_at BETWEEN " + starttime + " AND " + endtime+" " +"limit "+(pageid)+","+total;
			   
			List<TestFileLog> list = jdbcTemplate.query(querystr, new TestFileLogrowMapper()); 
				//To get the Exact Count			
			querystrTotal = querystrTotal + " file_rcvd_at BETWEEN " + starttime + " AND " + endtime;			
		totallist = jdbcTemplate.query(querystrTotal, new TestFileLogrowMapper());			
			
			numPages=Math.ceil(totallist.size()/divider); 
			
			
             op = "";
          
            for (int i =0; i<=total; i++) 
               {
        	   
        	   if(i>=list.size()){
        	   break;
        	   }
        	 
				op = op + "<tr data-toggle='collapse' href='#demo" + i
						+ "' class='accordion-toggle collapsed' aria-expanded='false'>";
				op = op + "				<td><button class='btn btn-default btn-xs'><i class='fa-icon-eye-open'></i></button></td>";
				op = op + "				<td>" + list.get(i).getRecordID() + "</td>";
				op = op + "				<td>" + list.get(i).getTestPlanId() + "</td>";
				op = op + "				<td>" + list.get(i).getRequestId() + "</td>";
				op = op + "				<td>" + list.get(i).getTestName() + "</td>";
				op = op + "				<td>" + list.get(i).getTestFileName() + "</td>";
				op = op + "				<td>" + list.get(i).getTestRequestedBy() + "</td>";
				op = op + "	<td style='white-space: nowrap;'>"
						+ new SimpleDateFormat("YYYY-MM-dd HH:MM:ss").format(new Date(list.get(i).getFileRcvdAt()))
						+ "</td>";
				op = op + "	<td style='white-space: nowrap;'>"
						+ new SimpleDateFormat("YYYY-MM-dd HH:MM:ss").format(new Date(list.get(i).getFileSentToProc()))
						+ "</td>";
				op = op + "	<td style='white-space: nowrap;'>"
						+ new SimpleDateFormat("YYYY-MM-dd HH:MM:ss").format(new Date(list.get(i).getFileCompleted()))
						+ "</td>";
				op = op + "	<td>" + (list.get(i).getTestDuration() / 1000.0f) + "</td>";
				op = op + "				<td>" + list.get(i).getTestType() + "</td>";
				op = op + "				<td>" + list.get(i).getNbrOfCallsReq() + "</td>";
				op = op + "				<td>" + list.get(i).getNbrOfCallsProc() + "</td>";
				op = op + "				<td>" + list.get(i).getCountryName() + "</td>";
				op = op + "				<td>" + list.get(i).getCountryCode() + "</td>";
				op = op + "				<td>" + list.get(i).getStartRange() + "</td>";
				op = op + "				<td>" + list.get(i).getCarrierSpec() + "</td>";
				op = op + "				<td>" + list.get(i).getRouteId() + "</td>";
				op = op + "				<td>" + list.get(i).getReportType() + "</td>";
				op = op + "				<td>" + list.get(i).getTestStatus() + "</td>";
				op = op + "				<td>" + list.get(i).getTestCode() + "</td>";
				op = op + "				<td>" + list.get(i).getSuccessfulCalls() + "</td>";
				op = op + "				<td>" + list.get(i).getFailedCalls() + "</td>";
				op = op + "				<td>" + list.get(i).getTest_code_desc() + "</td>";
				op = op + "				</tr>";
				op = op + "				<tr>";

				op = op + "    <td colspan='12' class='hiddenRow'><div class='accordian-body collapse' id='demo" + i
						+ "' aria-expanded='true'> ";
				op = op + "    <table class='table table-striped border-all' style='border:1px solid #ccc;'>";
				op = op + "    <thead>";
				op = op + "    <tr>";
				op = op + "    <th>RecordID</th>";
				op = op + "    <th>Testfilelog ID</th>";
				op = op + "    <th>Test Plan Id</th>";
				op = op + "    <th>Ticket Number</th>";
				op = op + "    <th>Country Code</th>";
				op = op + "    <th>Carrier Prefix</th>";
				op = op + "    <th>Number Dial</th>";
				op = op + "    <th>Call Start</th>";
				op = op + "    <th>Call Answer</th>";
				op = op + "    <th>Call End</th>";
				op = op + "    <th>Test Type</th>";
				op = op + "    <th>Origin Call Id</th>";
				op = op + "    <th>Termination Call Id</th>";
				op = op + "    <th>Sip Termination Status</th>";
				op = op + "    <th>Caller Uri</th>";
				op = op + "    <th>Called Uri</th>";
				op = op + "    <th>Qosalue</th>";
				op = op + "  		</tr>";
				op = op + "    </thead>";
				op = op + "    <tbody>";

				String query2 = "select * from testnumbercdr where testfilelogID=" + list.get(i).getRecordID();
				List<TestNumberCDR> list2 = jdbcTemplate.query(query2, new TestNumberCDRMapper());
				for (int j = 0; j < list2.size(); j++) {
					op = op + "<tr>";
					op = op + "<td>" + list2.get(j).getRecordID() + "</td>";
					op = op + "<td>" + list2.get(j).getTestfilelogID() + "</td>";
					op = op + "<td>" + list2.get(j).getTestPlanId() + "</td>";
					op = op + "<td>" + list2.get(j).getRequestId() + "</td>";
					op = op + "<td>" + list2.get(j).getCountryCode() + "</td>";
					op = op + "<td>" + list2.get(j).getCarrierPrefix() + "</td>";
					op = op + "<td>" + list2.get(j).getNumberDial() + "</td>";
					op = op + "<td style='white-space: nowrap;'>"
							+ new SimpleDateFormat("YYYY-MM-dd HH:MM:ss").format(new Date(list2.get(j).getCallStart()))
							+ "</td>";
					op = op + "<td style='white-space: nowrap;'>"
							+ new SimpleDateFormat("YYYY-MM-dd HH:MM:ss").format(new Date(list2.get(j).getCallAnswer()))
							+ "</td>";
					op = op + "<td style='white-space: nowrap;'>"
							+ new SimpleDateFormat("YYYY-MM-dd HH:MM:ss").format(new Date(list2.get(j).getCallEnd()))
							+ "</td>";
					op = op + "<td>" + list2.get(j).getTestType() + "</td>";
					op = op + "<td>" + list2.get(j).getOriginCallId() + "</td>";
					op = op + "<td>" + list2.get(j).getTerminationCallId() + "</td>";
					op = op + "<td>" + list2.get(j).getSip_terminationStatus() + "</td>";
					op = op + "<td>" + list2.get(j).getCalledUri() + "</td>";
					op = op + "<td>" + list2.get(j).getCalledUri() + "</td>";
					op = op + "<td><a href='#' class='btn btn-default btn-sm'>";
					op = op + "<i class='glyphicon glyphicon-cog'>" + list2.get(j).getQosValue() + "</i></a></td>";
					op = op + "</tr>";
				}
				op = op + "</tbody>";
				op = op + "</table>";
				op = op + "</div> </td>";
				op = op + "</tr>";
        	  
           }
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		op=op+"SEPERATOR"+numPages;
		return op;
		 
	}

	

}
