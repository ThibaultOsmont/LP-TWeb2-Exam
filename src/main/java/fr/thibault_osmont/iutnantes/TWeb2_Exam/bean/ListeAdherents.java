package fr.thibault_osmont.iutnantes.TWeb2_Exam.bean;

import java.util.LinkedList;

public class ListeAdherents {

	public final static LinkedList<Adherent> getList ()
	{
		LinkedList<Adherent> list = new LinkedList<>();
		list.add(new Adherent("Zola","Emile", "2 rue de Plantes", 44000, "Nantes", "FR" ) );
		list.add(new Adherent("Flaubert","Gustave", "23 Bd Foch", 35000, "Rennes", "FR" ) );
				
		return list ;
	}
}
