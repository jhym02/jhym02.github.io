package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
public class CropsDTO {
	
	private String crop_classification;
	private String crop_name;
	private float total_area;
	private float sample_area;
	private float ars_kg;
	private float ton;
	private float area_inc_dec_rate;
	private float production_inc_dec_rate;
	private int farmhouses;

}
