package com.comlink.model;

public class TestNumberCDR {
	
    private int RecordID;
    private int testfilelogID;
    private String testPlanId;
    private String requestId;
    private int countryCode;
    private int carrierPrefix;
    private long numberDial;
    private long callStart;
    private long callAnswer;
    private long callEnd;
    private String testType;
    private String originCallId;
    private String terminationCallId;
    private int sip_terminationStatus;
    private String callerUri;
    private String calledUri;
    private double qosValue;
	public int getRecordID() {
		return RecordID;
	}
	public void setRecordID(int recordID) {
		RecordID = recordID;
	}
	public int getTestfilelogID() {
		return testfilelogID;
	}
	public void setTestfilelogID(int testfilelogID) {
		this.testfilelogID = testfilelogID;
	}
	public String getTestPlanId() {
		return testPlanId;
	}
	public void setTestPlanId(String testPlanId) {
		this.testPlanId = testPlanId;
	}
	public String getRequestId() {
		return requestId;
	}
	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}
	public int getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(int countryCode) {
		this.countryCode = countryCode;
	}
	public int getCarrierPrefix() {
		return carrierPrefix;
	}
	public void setCarrierPrefix(int carrierPrefix) {
		this.carrierPrefix = carrierPrefix;
	}
	public long getNumberDial() {
		return numberDial;
	}
	public void setNumberDial(long numberDial) {
		this.numberDial = numberDial;
	}
	public long getCallStart() {
		return callStart;
	}
	public void setCallStart(long callStart) {
		this.callStart = callStart;
	}
	public long getCallAnswer() {
		return callAnswer;
	}
	public void setCallAnswer(long callAnswer) {
		this.callAnswer = callAnswer;
	}
	public long getCallEnd() {
		return callEnd;
	}
	public void setCallEnd(long callEnd) {
		this.callEnd = callEnd;
	}
	public String getTestType() {
		return testType;
	}
	public void setTestType(String testType) {
		this.testType = testType;
	}
	public String getOriginCallId() {
		return originCallId;
	}
	public void setOriginCallId(String originCallId) {
		this.originCallId = originCallId;
	}
	public String getTerminationCallId() {
		return terminationCallId;
	}
	public void setTerminationCallId(String terminationCallId) {
		this.terminationCallId = terminationCallId;
	}
	public int getSip_terminationStatus() {
		return sip_terminationStatus;
	}
	public void setSip_terminationStatus(int sip_terminationStatus) {
		this.sip_terminationStatus = sip_terminationStatus;
	}
	public String getCallerUri() {
		return callerUri;
	}
	public void setCallerUri(String callerUri) {
		this.callerUri = callerUri;
	}
	public String getCalledUri() {
		return calledUri;
	}
	public void setCalledUri(String calledUri) {
		this.calledUri = calledUri;
	}
	public double getQosValue() {
		return qosValue;
	}
	public void setQosValue(double qosValue) {
		this.qosValue = qosValue;
	}

}
