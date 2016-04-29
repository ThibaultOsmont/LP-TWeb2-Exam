package fr.thibault_osmont.iutnantes.TWeb2_Exam.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fr.thibault_osmont.iutnantes.TWeb2_Exam.bean.Adherent;
import fr.thibault_osmont.iutnantes.TWeb2_Exam.bean.Article;
import fr.thibault_osmont.iutnantes.TWeb2_Exam.bean.Commande;
import fr.thibault_osmont.iutnantes.TWeb2_Exam.bean.ListeAdherents;
import fr.thibault_osmont.iutnantes.TWeb2_Exam.bean.ListeArticles;
import fr.thibault_osmont.iutnantes.TWeb2_Exam.bean.ListePays;
import fr.thibault_osmont.iutnantes.TWeb2_Exam.commons.Const;

@Controller
public class Controleur {

	@RequestMapping("/")
	public String index(HttpSession session) {
		
		if(session.getAttribute(Const.SESSION_USER) != null) {
			System.out.println("Utilisateur " + session.getAttribute(Const.SESSION_USER) + " authentifie.");
		}
		
		else {
			return "login";
		}
		
		return "";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request, HttpSession session) {
		
		String login 	= request.getParameter("id");
		String password = request.getParameter("password");
		
		System.out.println("Utilisateur: " + login);
		
		if(null != password && password.equalsIgnoreCase("ok")) {
			System.out.println("Authentification ok. Bienvenue !");
			session.setAttribute(Const.SESSION_USER, login);
			return "accueil";
		}
		
		else {
			System.out.println("Echec de l'authentification !");
			return "login";
		}
	}
	
	@RequestMapping("/accueil")
	public String accueil(ModelMap model, HttpSession session) {
		
		model.addAttribute("user", session.getAttribute(Const.SESSION_USER));
		
		return "accueil";
	}
	
	@RequestMapping("/consulter_articles")
	public String consulterArticles(ModelMap model, HttpSession session) {
		model.addAttribute("user", session.getAttribute(Const.SESSION_USER));
		model.addAttribute("articles", ListeArticles.getList());
		
		return "articles";
	}
	
	@RequestMapping("consulter_commande")
	public String consulterCommande(ModelMap model, HttpSession session) {
		
		if(session.getAttribute(Const.COMMANDE) == null) {
			System.out.println("Aucune commande encore enregistree.");
			session.setAttribute(Const.COMMANDE, new Commande());
		}
		
		Commande com = (Commande) session.getAttribute(Const.COMMANDE);
		model.addAttribute("user", session.getAttribute(Const.SESSION_USER));
		model.addAttribute("articles", com.getListe());
		
		return "commande";
	}
	
	@RequestMapping("/commanderArticle")
	public String commander(ModelMap model, HttpSession session, @RequestParam(name = "art") String codeArt) {
		Article art = ListeArticles.chercherArticle(ListeArticles.getList(), codeArt);
		
		if(session.getAttribute(Const.COMMANDE) == null) {
			session.setAttribute(Const.COMMANDE, new Commande());
		}
		
		Commande com = (Commande) session.getAttribute(Const.COMMANDE);
		com.commanderArticle(art);
		
		return "redirect:/consulter_articles";
	}
	
	@RequestMapping("/createAccount")
	public String creationCompte(ModelMap model) {
		model.addAttribute("lpays", ListePays.getList());
		
		return "creationCompte";
	}
	
	//TODO
	@RequestMapping("/saveAccount")
	public String enregistrerCompte(HttpSession session, HttpServletRequest request) {
		String id = request.getParameter("id");
		String mdp = request.getParameter("password");
		String prenom = request.getParameter("prenom");
		String nom = request.getParameter("nom");
		String adresse = request.getParameter("addr");
		String codePostal = request.getParameter("zipCode");
		String ville = request.getParameter("ville");
		String pays = request.getParameter("pays");
		
		int zipCode = -1;
		try {
			zipCode = Integer.parseInt(codePostal);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		Adherent adh = new Adherent(nom, prenom, adresse, zipCode, ville, pays);
		ListeAdherents.getList().add(adh);
		
		System.out.println("Adhérent cree et ajoute avec le code postal " + zipCode);
		
		if(mdp.equalsIgnoreCase("ok")) {
			session.setAttribute(Const.SESSION_USER, id);
			return "redirect:/accueil";
		}
		
		else {
			return "redirect:/";
		}
	}
	
	@RequestMapping("annuler_commande")
	public String annulerCommande(HttpSession session) {
		
		session.setAttribute(Const.COMMANDE, new Commande());
		
		return "redirect:/accueil";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.setAttribute(Const.SESSION_USER, null);
		
		return "redirect:/login";
	}
}
