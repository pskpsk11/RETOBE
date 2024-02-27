package kr.co.retobe.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@PropertySource("classpath:chat.properties")
@Component
public class Chatbot {
	@Value("${chatgpt.api}")
	private String api;
	
	public String getApi() {
		String temp = api ;
		System.out.println(temp+"///////");
		return temp;
		//return this.api;
	}

}
