package ${sourceBasePackage}.${entityPackage}.controller;
import ${sourceBasePackage}.${entityPackage}.model.${className};
import ${sourceBasePackage}.${entityPackage}.service.${className}Mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;




/**
 * 
 * ${description}controller
 * 
 * <pre>
 * 	历史记录：
 * 	${createDate} ${author}
 * 	新建文件
 * </pre>
 * 
 * @author 
 * <pre>
 * SD
 * 	${author}
 * PG
 *	${author}
 * UT
 *
 * MA
 * </pre>
 * @version $Rev$
 *
 * <p/> $Id$
 *
 */
@Controller
@RequestMapping("/${className?uncap_first}")
public class ${className}Controller {

	@Autowired
	private ${className}Mapper ${className?uncap_first}Mapper;

	/**
	 * 查询所有数据
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"","/"})
	public String list(Model model){
		List<${className}> result = ${className?uncap_first}Mapper.getAll${className}();
		model.addAttribute("pageData", result);
		return "${className?uncap_first}";
	}
	/**
	 * 新增
	 * @param ${className?uncap_first}
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST )
	public String add(${className} ${className?uncap_first},Model model){
		
		boolean result = ${className?uncap_first}Mapper.add(${className?uncap_first});
		if(result){
			model.addAttribute("message", "add successed!");
		}else{
			model.addAttribute("message", "add fail!");
		}
		return this.list(model);
	}
	/**
	 * 删除
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.GET )
	public String delete(@RequestParam(value="id") int id,Model model){
		boolean result = ${className?uncap_first}Mapper.deleteById(id);
		if(result){
			model.addAttribute("message", "delete successed!");
		}else{
			model.addAttribute("message", "delete fail!");
		}
		
		return "redirect:/${className?uncap_first}";
	}
	/**
	 * 根据ID查询指定数据
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/update",method=RequestMethod.GET )
	public @ResponseBody String update(@RequestParam(value="id") int id){
		${className} ${className?uncap_first} = ${className?uncap_first}Mapper.get${className}ById(id);
		return JSON.toJSONString(${className?uncap_first});
	}
	/**
	 * 编辑
	 * @param ${className?uncap_first}
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST )
	public String update(${className} ${className?uncap_first},Model model){
		boolean result = ${className?uncap_first}Mapper.update(${className?uncap_first});
		if(result){
			model.addAttribute("message", "update successed!");
		}else{
			model.addAttribute("message", "update fail!");
		}
		return this.list(model);
	}
}
