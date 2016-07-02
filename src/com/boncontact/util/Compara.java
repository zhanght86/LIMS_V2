package com.boncontact.util;

import java.util.Comparator;

import com.boncontact.domain.SelfSendSampleInfo;

public class Compara implements Comparator<SelfSendSampleInfo> {

	@Override
	public int compare(SelfSendSampleInfo o1, SelfSendSampleInfo o2) {
		// TODO 自动生成的方法存根
		return o1.getId() > o2.getId() ? 1 : 0;
	}

}
