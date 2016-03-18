package com.atzpj.dao;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.atzpj.entities.Department;
import com.atzpj.entities.Employee;

@Component
public class EmployeeConvert implements Converter<String, Employee> {

	@Override
	public Employee convert(String source) {
		System.out.println("--------------------converts1111");
		Employee result = new Employee();
		if(source!=null){
		String[] employeeinfo= source.split(";");
		for (String string : employeeinfo) {
			System.out.println(string);
		}
		if(employeeinfo.length==4&&employeeinfo!=null){
		result.setLastName(employeeinfo[0]);
		result.setEmail(employeeinfo[1]);
		result.setGender(Integer.parseInt(employeeinfo[2]));
		Department department=new Department();
		department.setId(Integer.parseInt(employeeinfo[3]));
		result.setDepartment(department);
		}
		}
		return result;
	}
}
