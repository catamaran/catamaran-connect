package org.catamarancode.connect.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.catamarancode.connect.entity.Person;
import org.catamarancode.connect.entity.support.Repository;
import org.catamarancode.connect.service.IdentifiableListing;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@Scope("request")
public class MainController {

    private Logger logger = LoggerFactory.getLogger(MainController.class);

    @Resource
    private Repository repository;
    
    @Autowired
	private IdentifiableListing personListing;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String slash(Map<String,Object> model) {
    	return index(model);
    }
    
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Map<String,Object> model) {
    	
    	SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, MMMM d");
    	
    	Set<Criterion> criteria = new HashSet<Criterion>();
    	criteria.add(Restrictions.isNotNull("nextCallDate"));
    	criteria.add(Restrictions.eq("deleted", false));
    	
    	List<Order> orders = new ArrayList<Order>();
		orders.add(Order.asc("nextCallDate"));
		orders.add(Order.asc("lastName"));
		orders.add(Order.asc("firstName"));
		List<Person> list = Person.objects.filter(criteria, orders);
    	
    	logger.debug("Got people: " + list.size());
		// Save to HttpSession so that we can support previous/next navigation on view screens
		personListing.reset(list, "Home", "");
		
		// Group people by next call date
		List<String> dateStrList = new ArrayList<String>();
		Map<String, List<Person>> byDateMap = new HashMap<String, List<Person>>();
		for (Person person : list) {
			String dateStr = dateFormat.format(person.getNextCallDate());			
			if (!dateStrList.contains(dateStr)) {
				dateStrList.add(dateStr);
			}
			
			List<Person> personsForDateStr = byDateMap.get(dateStr);
			if (personsForDateStr == null) {
				personsForDateStr = new ArrayList<Person>();
				byDateMap.put(dateStr, personsForDateStr);
			}
			personsForDateStr.add(person);
		}
    	
    	model.put("persons", list);
    	model.put("personsByDate", byDateMap);
    	model.put("dateGroups", dateStrList);
    	
    	return "index";
    }

}
