package com.comlink.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.comlink.model.TestNumberCDR;



public class TestNumberCDRMapper implements RowMapper<TestNumberCDR>{


	public TestNumberCDR mapRow(ResultSet resultSet, int rowcount) throws SQLException {
		TestNumberCDR testNumberCDR=new TestNumberCDR();
	    testNumberCDR.setRecordID(resultSet.getInt("RecordID"));
	    testNumberCDR.setTestfilelogID(resultSet.getInt("testfilelogID"));
	    testNumberCDR.setTestPlanId(resultSet.getString("test_plan_id"));
	    testNumberCDR.setRequestId(resultSet.getString("request_id"));
	    testNumberCDR.setCountryCode(resultSet.getInt("country_code"));
	    testNumberCDR.setCarrierPrefix(resultSet.getInt("carrier_prefix"));
	    testNumberCDR.setNumberDial(resultSet.getLong("number_dial"));
	    testNumberCDR.setCallStart(resultSet.getLong("call_start"));
	    testNumberCDR.setCallAnswer(resultSet.getLong("call_answer"));
	    testNumberCDR.setCallEnd(resultSet.getLong("call_end"));
	    testNumberCDR.setTestType(resultSet.getString("test_type"));
	    testNumberCDR.setOriginCallId(resultSet.getString("origin_call_id"));
	    testNumberCDR.setTerminationCallId(resultSet.getString("termination_call_id"));
	    testNumberCDR.setSip_terminationStatus(resultSet.getInt("sip_termination_status"));
	    testNumberCDR.setCallerUri(resultSet.getString("caller_uri"));
	    testNumberCDR.setCalledUri(resultSet.getString("called_uri"));
	    testNumberCDR.setQosValue(resultSet.getDouble("qos_value"));
		return testNumberCDR;
	}

}
