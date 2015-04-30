#Classe permettant d'afficher un menu laissant le choix au joueur de faire ce qu'il veut
class Menu

	##
	#Méthode permettant au joueur de choisir ce qu'il veut faire
	def Menu.afficher(fenetre, langue)

		padding = 20

		boutonJouer = Gtk::Button.new("Test dev")
		boutonModeDeJeu = Gtk::Button.new(langue.jouer)
		boutonTutoriel = Gtk::Button.new(langue.tutoriel)
		boutonOptions = Gtk::Button.new(langue.options)
		boutonCredits = Gtk::Button.new(langue.credits)
		boutonQuitter = Gtk::Button.new(langue.quitter)

		vbox = Gtk::VBox.new(false,10)

		boutonJouer.signal_connect('clicked'){
			fenetre.remove(vbox)
			Jouer.afficher(fenetre, langue, "rapide", 1)
		}
		
		boutonTutoriel.signal_connect('clicked'){
			fenetre.remove(vbox)
			Tuto.afficher(fenetre, langue)
		}

		boutonModeDeJeu.signal_connect('clicked'){
			fenetre.remove(vbox)
			ModeDeJeu.afficher(fenetre, langue)
		}
		
		boutonOptions.signal_connect('clicked'){
			fenetre.remove(vbox)
			Options.afficher(fenetre, langue)
		}
		
		boutonCredits.signal_connect('clicked'){
			fenetre.remove(vbox)
			Credits.afficher(fenetre, langue)
		}

		fenetre.signal_connect('destroy') {
  			 Gtk.main_quit
		}
		
		boutonQuitter.signal_connect('clicked'){Gtk.main_quit}
	
		vbox = Gtk::VBox.new(false,10)
		
		# Ajout des boutons a la vbox
		#vbox.pack_start(boutonJouer, false, false, padding)
		vbox.pack_start(boutonModeDeJeu, false, false, padding)
		vbox.pack_start(boutonTutoriel, false, false, padding)
		vbox.pack_start(boutonOptions, false, false, padding)
		vbox.pack_start(boutonCredits, false, false, padding)
		vbox.pack_start(boutonQuitter, false, false, padding)

		fenetre.add(vbox)
		fenetre.show_all
		fenetre.reshow_with_initial_size
	end

end # Marqueur de fin de classe
