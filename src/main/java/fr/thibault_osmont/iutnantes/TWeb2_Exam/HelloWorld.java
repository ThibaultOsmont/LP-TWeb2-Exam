package fr.thibault_osmont.iutnantes.TWeb2_Exam;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Hello world!
 *
 * @author Thibault OSMONT
 */
@Controller
public class HelloWorld 
{
	public HelloWorld() {
		System.out.println("Controleur initialise.");
	}
	
    @RequestMapping("/hello")
    public String hello(@RequestParam(name = "name", defaultValue = "World") String name, ModelMap model) {
    	
    	model.addAttribute("name", name);
    	
    	return "helloworld";
    }
}
