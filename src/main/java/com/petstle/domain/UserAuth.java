package com.petstle.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserAuth {
	private String name;
	private String gender;
	private String birth;
	private String unique_key;
	private String unique_in_site;
}
