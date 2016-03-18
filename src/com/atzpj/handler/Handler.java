package com.atzpj.handler;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.atzpj.dao.DepartmentDao;
import com.atzpj.dao.EmployeeConvert;
import com.atzpj.dao.EmployeeDao;
import com.atzpj.entities.Employee;

@Controller
//@RequestMapping(value="/order")
public class Handler {
	@Autowired
	private DepartmentDao departmentDao;
	@Autowired
	private EmployeeDao employeeDao;
	@Autowired
	private EmployeeConvert employeeConvert;
	
	@RequestMapping(value="/emps",method=RequestMethod.GET)
	public String list(Map<String, Object> map){
		 map.put("employees",employeeDao.getAll());
		return "list";
	}
	
	@RequestMapping(value="/emp",method=RequestMethod.GET)
	public String input(Map<String,Object> map){
		map.put("employee", new Employee());
		map.put("genders", getGenderUtils());
		map.put("departments", departmentDao.getDepartments());
		return "input";
	}
	public Map<String, String> getGenderUtils(){
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("1", "male");
		map.put("0", "famale");
		return map;
	}
	
	
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	public String save(Employee employee){
		
		System.out.println("--------------------------------S");
		employeeDao.save(employee);
		return "redirect:/emps";
	}
	
	
	@RequestMapping(value="/emp/{id}",method=RequestMethod.DELETE)
	public String delete(@PathVariable("id") Integer id){
		System.out.println("delete......");
		employeeDao.delete(id);
		
		return "redirect:/emps";
	}
	
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	public String edit(@PathVariable("id") Integer id,Map<String, Object> map){
	
		
		map.put("genders", getGenderUtils());
		map.put("departments", departmentDao.getDepartments());
		map.put("employee", employeeDao.get(id));
		return "edit";
	}
	
	@RequestMapping(value="/emp",method=RequestMethod.PUT)
	public String update(Employee employee){
		employeeDao.save(employee);
		return "redirect:/emps";
	}
	
	@ModelAttribute
	public void getEmployeeById(@RequestParam(value="id",required=false) Integer id,Map<String, Object> map ){
		if(id!=null){
			map.put("employee", employeeDao.get(id));
		}
		
	}
	
	@RequestMapping(value="/conversion",method=RequestMethod.POST)
	public String saveEmployee(@RequestParam("employee") Employee employee){
		System.out.println("saveEmployeestr");
		
		employeeDao.save(employee);
		
		return "redirect:/emps";
	}
}
