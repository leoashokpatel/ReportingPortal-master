package com.comlink.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.comlink.model.TestFileLog;

public class TestFileLogrowMapper implements RowMapper<TestFileLog> {

	public TestFileLog mapRow(ResultSet resultSet, int rowcount) throws SQLException {
		TestFileLog testfilelog=new TestFileLog();
	    testfilelog.setRecordID(resultSet.getInt("RecordID"));
	    testfilelog.setTestPlanId(resultSet.getString("test_plan_id"));
	    testfilelog.setRequestId(resultSet.getString("request_id"));
	    testfilelog.setTestName(resultSet.getString("test_name"));
	    testfilelog.setTestFileName(resultSet.getString("test_file_name"));
	    testfilelog.setTestRequestedBy(resultSet.getString("test_requested_by"));
	    testfilelog.setFileRcvdAt(resultSet.getLong("file_rcvd_at"));
	    testfilelog.setFileSentToProc(resultSet.getLong("file_sent_to_proc"));
	    testfilelog.setFileCompleted(resultSet.getLong("file_completed"));
	    testfilelog.setTestDuration(resultSet.getLong("test_duration"));
	    testfilelog.setTestType(resultSet.getString("test_type"));
	    testfilelog.setNbrOfCallsReq(resultSet.getInt("nbr_of_calls_req"));
	    testfilelog.setNbrOfCallsProc(resultSet.getInt("nbr_of_calls_proc"));
	    testfilelog.setCountryName(resultSet.getString("country_name"));
	    testfilelog.setCountryCode(resultSet.getInt("country_code"));
	    testfilelog.setStartRange(resultSet.getString("start_range"));
	    testfilelog.setCarrierSpec(resultSet.getString("carrier_spec"));
	    testfilelog.setRouteId(resultSet.getString("route_id"));
	    testfilelog.setReportType(resultSet.getString("report_type"));
	    testfilelog.setTestStatus(resultSet.getString("test_status"));
	    testfilelog.setTestCode(resultSet.getInt("test_code"));
	    testfilelog.setSuccessfulCalls(resultSet.getInt("successful_calls"));
	    testfilelog.setFailedCalls(resultSet.getInt("failed_calls"));
	    testfilelog.setTest_code_desc(resultSet.getString("test_code_desc"));
		return testfilelog;
	}

}
