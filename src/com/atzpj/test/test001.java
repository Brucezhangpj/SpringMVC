package com.atzpj.test;

import java.io.File;
import java.io.IOException;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.atzpj.dao.EmployeeDao;
import com.atzpj.entities.Employee;

@Controller
public class test001 {

	@Autowired
	private EmployeeDao employeeDao;
	
	@RequestMapping(value="/testUpload",method=RequestMethod.POST)
	public String testUpload(@RequestParam("file") MultipartFile[] file) throws IllegalStateException, IOException{
		System.out.println("---业务方法");
		for (MultipartFile multipartFile : file) {
			if(!multipartFile.isEmpty()){
				multipartFile.transferTo(new File("D:\\44\\"+ multipartFile.getOriginalFilename()));
			}
		}
		return "ok";
	}
		

	@RequestMapping(value="/testRequestBody",method=RequestMethod.POST)
	public String testRequestBody(@RequestBody String content){
		System.out.println("content+:"+content);
		return "list";
	}
	
	@ResponseBody
	@RequestMapping(value="/json",method=RequestMethod.POST)
	public Collection<Employee> Json(){
		
		return employeeDao.getAll();
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/testJson",method=RequestMethod.POST)
	public String testJson(){
		
		return "nidayede,我就不出来";
	}
}
