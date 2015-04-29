# encoding: UTF-8

##
# Auteur LOIZEAU Sylvain
# Version 0.1 : Date : Wed Jan 21 13:47:35 CET 2015
#

class PartieRapide

	def PartieRapide.afficher(fenetre, langue, mode)

		padding = 20
		vbox = Gtk::VBox.new(false,10)

		boutonJouer = Gtk::Button.new(langue.pr_jouer)
		boutonAlea = Gtk::Button.new(langue.pr_alea)
		boutonSave = Gtk::Button.new("Reprendre une sauvegarde")
		boutonRetour = Gtk::Button.new(langue.retour)
		boutonQuitter = Gtk::Button.new(langue.quitter)
		labelDifficulte = Gtk::Label.new(langue.pr_diff)
		comboBoxDifficulte = Gtk::ComboBox.new()
		labelTaille = Gtk::Label.new(langue.pr_taille)
		comboBoxTaille = Gtk::ComboBox.new()
		id_grille = nil

		ModelGrille.getDifficulte().each{ |x|
			comboBoxDifficulte.append_text(x.to_s)
		}

		ModelGrille.getTaille().each{ |x|
			comboBoxTaille.append_text(x.to_s)
		}

		comboBoxDifficulte.signal_connect('changed'){
			id_grille = ModelGrille.getGrilleByDifficulteAndTaille(comboBoxDifficulte.active_text.to_i, comboBoxTaille.active_text.to_i)
			if(id_grille != nil)
				boutonJouer.set_sensitive(true)
			else
				boutonJouer.set_sensitive(false)
			end
		}

		boutonSave.signal_connect('clicked'){
			fenetre.remove(vbox)
			old = ModelScore.getScoreByJoueurAndMode($joueur.id,0)
			if old != nil
				p "old != nil"
				Jouer.afficher(fenetre, langue, mode, old.grille)
			end
			
		}

		comboBoxTaille.signal_connect('changed'){
			id_grille = ModelGrille.getGrilleByDifficulteAndTaille(comboBoxDifficulte.active_text.to_i, comboBoxTaille.active_text.to_i)
			if(id_grille != nil)
				boutonJouer.set_sensitive(true)
			else
				boutonJouer.set_sensitive(false)
			end
			
		}

		boutonJouer.signal_connect('clicked'){
			fenetre.remove(vbox)
			Jouer.afficher(fenetre, langue, mode, id_grille)
		}

		boutonAlea.signal_connect('clicked'){
			fenetre.remove(vbox)
			Jouer.afficher(fenetre, langue, mode, (Random.new(Time.now.sec).rand(1..7000)))#get alea
		}

		boutonRetour.signal_connect('clicked'){
			fenetre.remove(vbox)
			Menu.afficher(fenetre, langue)
		}

		boutonQuitter.signal_connect('clicked') {
			fenetre.remove(vbox)
  			Menu.afficher(fenetre, langue)
		}
		
		boutonQuitter.signal_connect('clicked'){Gtk.main_quit}
	
		vbox = Gtk::VBox.new(false,10)
		
		comboBoxDifficulte.set_active(0);
		comboBoxTaille.set_active(0);
		# Ajout des boutons a la vbox
		vbox.pack_start(labelDifficulte, false, false, padding)
		vbox.pack_start(comboBoxDifficulte, false, false, padding)
		vbox.pack_start(labelTaille, false, false, padding)
		vbox.pack_start(comboBoxTaille, false, false, padding)
		vbox.pack_start(boutonJouer, false, false, padding)
		vbox.pack_start(boutonSave, false, false, padding)
		vbox.pack_start(boutonAlea, false, false, padding)
		vbox.pack_start(boutonRetour, false, false, padding)
		vbox.pack_start(boutonQuitter, false, false, padding)

		boutonSave.set_sensitive(false)



		if !(ModelJoueur.testAnon($joueur))
			old = ModelScore.getScoreByJoueurAndMode($joueur.id,0)
			if old != nil
				p "old != nil"
				boutonSave.set_sensitive(true)
			end
		end

		fenetre.add(vbox)
		fenetre.show_all
		fenetre.reshow_with_initial_size
	end

end # Marqueur de fin de classe
