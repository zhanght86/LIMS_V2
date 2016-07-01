package com.boncontact.util;

import java.util.Calendar;
import java.util.Date;

public class DateUtils {

	/**
	 * 日期计算，传入一个日期和需要加减的int值
	 * 
	 * @return
	 */
	public static Date dateCount(Date nowDate, int num) {
		Calendar rightNow = Calendar.getInstance();
		rightNow.setTime(nowDate);
		rightNow.add(Calendar.DAY_OF_YEAR, num);
		Date dt1 = rightNow.getTime();
		return dt1;
	}
}
