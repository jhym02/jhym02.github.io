package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

//전체생성자
@AllArgsConstructor

//기본생성자
@NoArgsConstructor

@Getter
@Setter
@RequiredArgsConstructor

public class MemberDTO {
   
   @NonNull private String mem_id;
   @NonNull private String mem_pw;
   private String mem_name;
   private String mem_phone;
   private String mem_addr;
   private String mem_nick;
   private String mem_birthdate;
   private String mem_gender;
   private String mem_type;
   


public MemberDTO(String mem_id,String mem_pw,String mem_name,String mem_phone,String mem_addr,String mem_nick,String mem_type ) {
   this.mem_id=mem_id;
   this.mem_pw=mem_pw;
   this.mem_phone=mem_phone;
   this.mem_addr=mem_addr;
   this.mem_name=mem_name;
   this.mem_nick=mem_nick;
   this.mem_type=mem_type;
   
   
}
}

