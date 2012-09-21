package org.catamarancode.connect.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.catamarancode.connect.entity.Person;
import org.catamarancode.connect.entity.support.Repository;
import org.catamarancode.entity.support.PersistableBase;
import org.catamarancode.spring.mvc.DisplayMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {

    private Logger logger = LoggerFactory.getLogger(MainController.class);

    @Resource
    private Repository repository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String slash(Map<String,Object> model) {
    	return index(model);
    }
    
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Map<String,Object> model) {
    	
    	Person person = new Person();
    	//PersistableBase.setEntityServices(services)
    	
    	List<Person> list = Person.objects.all();
    	logger.debug("Got people: " + list.size());
    	model.put("persons", list);
    	
    	return "index";
    }

}
