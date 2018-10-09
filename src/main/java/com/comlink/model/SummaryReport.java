package com.comlink.model;

import java.sql.Date;

public class SummaryReport {
	private Date startdate;
	private Date enddate;
	private int ticketNumber;
	
	private String requestSource;
	private String carrierRoute;
	private String[] typeTest;
	private String optionsRadios;
	private String sReport;
	
	
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	
	
	public int getTicketNumber() {
		return ticketNumber;
	}
	public void setTicketNumber(int ticketNumber) {
		this.ticketNumber = ticketNumber;
	}
	public String getRequestSource() {
		return requestSource;
	}
	public void setRequestSource(String requestSource) {
		this.requestSource = requestSource;
	}
	public String getCarrierRoute() {
		return carrierRoute;
	}
	public void setCarrierRoute(String carrierRoute) {
		this.carrierRoute = carrierRoute;
	}
	public String[] getTypeTest() {
		return typeTest;
	}
	public void setTypeTest(String typeTest[]) {
		this.typeTest = typeTest;
	}
	public String getOptionsRadios() {
		return optionsRadios;
	}
	public void setOptionsRadios(String optionsRadios) {
		this.optionsRadios = optionsRadios;
	}
	public String getsReport() {
		return sReport;
	}
	public void setsReport(String sReport) {
		this.sReport = sReport;
	}
	
	
}
