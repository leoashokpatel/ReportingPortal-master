package com.comlink.dao;

import java.sql.Date;
import java.util.List;

import com.comlink.model.SummaryReport;
import com.comlink.model.TestFileLog;
import com.comlink.model.TestNumberCDR;

public interface ReportDAO 
{
	public String getSummaryReport(SummaryReport summeryReport);
    public  List<TestFileLog> downloadsummaryReport(Date sqlDates, Date sqlDatee,String focusedInput ,String RequestSource, String carrierroute,String optionsRadios,String[] type_test);
    public List<TestNumberCDR> downloadDetailReport(Date sqlDates, Date sqlDatee,String focusedInput ,String RequestSource, String carrierroute,String optionsRadios,String[] type_test,TestFileLog testfilelog);
	public List<TestNumberCDR> getTestNumberCDR(int testFileLogID);
	public String getRecordsByPage(SummaryReport summeryReport,int pageid,int total);

}




