package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor

//기본생성자
@NoArgsConstructor

@Getter
@Setter

public class OrgsDTO {

	private String org_name;
	private String org_sigun;
	private String org_addr;
	private String org_tel;
}
