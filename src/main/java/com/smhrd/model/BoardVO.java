package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@Getter
@ToString
public class BoardVO {
    
 
	private int est_idx;
    @NonNull private String mem_id; // @NonNull을 사용하여 null이 되지 않도록 요구합니다.
    @NonNull private String est_no;
    @NonNull private String est_title;
    private String est_file;
    @NonNull private String est_content;
    @NonNull private String est_amount;
    @NonNull private String est_auth;
    @NonNull private String est_status;
    private String created_at;
	public BoardVO(int est_idx, @NonNull String mem_id, @NonNull String est_title, String est_file,
			@NonNull String est_content, @NonNull String est_amount, @NonNull String est_auth,
			@NonNull String est_status) {
		this.est_idx = est_idx;
		this.mem_id = mem_id;
		this.est_title = est_title;
		this.est_file = est_file;
		this.est_content = est_content;
		this.est_amount = est_amount;
		this.est_auth = est_auth;
		this.est_status = est_status;
	}


    
    
}
