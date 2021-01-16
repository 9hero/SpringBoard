package com.last.train.dto;

import lombok.Data;

@Data
public class PageDTO {
	private int page;
	private int gRow_lo;
	private int gRow_Hi;
	private int lastPage;
	private int pageBtnStart;
	private int pageBtnEnd;
}
