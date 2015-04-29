#Options_graphiques.rb


class Graphique

	#Couleur de jeu (de base rouge/bleu)
	@@couleur1
	@@couleur2
	@@c1
	@@c2
	@@couleur1Alt
	@@couleur2AlT
	@@c1Alt
	@@c2Alt

	def initialize()
		@@c1 = Gdk::Color.parse("#2222EE")
		@@c2 = Gdk::Color.parse("#EE2222")
		@@couleur1 = Gtk::Style.new	
		@@couleur2 = Gtk::Style.new
		@@couleur1.set_bg(Gtk::STATE_PRELIGHT, @@c1.red, @@c1.green, @@c1.blue)
		@@couleur1.set_bg(Gtk::STATE_NORMAL, @@c1.red, @@c1.green, @@c1.blue)
		@@couleur2.set_bg(Gtk::STATE_PRELIGHT, @@c2.red, @@c2.green, @@c2.blue)
		@@couleur2.set_bg(Gtk::STATE_NORMAL, @@c2.red, @@c2.green, @@c2.blue)
		@@c1Alt = Gdk::Color.parse("#5555FF")
		@@c2Alt = Gdk::Color.parse("#BB2222")
		@@couleur1Alt = Gtk::Style.new	
		@@couleur2Alt = Gtk::Style.new
		@@couleur1Alt.set_bg(Gtk::STATE_PRELIGHT, @@c1Alt.red, @@c1Alt.green, @@c1Alt.blue)
		@@couleur1Alt.set_bg(Gtk::STATE_NORMAL, @@c1Alt.red, @@c1Alt.green, @@c1Alt.blue)
		@@couleur2Alt.set_bg(Gtk::STATE_PRELIGHT, @@c2Alt.red, @@c2Alt.green, @@c2Alt.blue)
		@@couleur2Alt.set_bg(Gtk::STATE_NORMAL, @@c2Alt.red, @@c2Alt.green, @@c2Alt.blue)
	end

	def couleur1
		return @@couleur1
	end

	def couleur2
		return @@couleur2
	end
	
	def couleur1Alt
		return @@couleur1Alt
	end

	def couleur2Alt
		return @@couleur2Alt
	end

	def Graphique.afficher(fenetre, langue)
		
		vbox = Gtk::VBox.new(false,10)
		vbox1 = Gtk::VBox.new(false,10)
		vbox2 = Gtk::VBox.new(false,10)
		hbox = Gtk::HBox.new(false,40)

		boutonCouleur1 = Gtk::ColorButton.new(@@c1)
		boutonCouleur2 = Gtk::ColorButton.new(@@c2)
		boutonCouleur1Alt = Gtk::ColorButton.new(@@c1Alt)
		boutonCouleur2Alt = Gtk::ColorButton.new(@@c2Alt)
		set = Gtk::ComboBox.new()
		set.append_text("1")
		set.append_text("2")
		set.append_text("3")

		set.signal_connect('changed'){
			case set.active_text.to_i
				when 1
					@@c1 = Gdk::Color.parse("#2222EE")
					@@c2 = Gdk::Color.parse("#EE2222")
					@@c1Alt = Gdk::Color.parse("#5555FF")
					@@c2Alt = Gdk::Color.parse("#BB2222")
				when 2
					@@c1 = Gdk::Color.parse("#9022EE")
					@@c2 = Gdk::Color.parse("#EE2290")
					@@c1Alt = Gdk::Color.parse("#BB22BB")
					@@c2Alt = Gdk::Color.parse("#BB22BB")
				when 3
					@@c1 = Gdk::Color.parse("#22EEEE")
					@@c2 = Gdk::Color.parse("#EEEE22")
					@@c1Alt = Gdk::Color.parse("#22BBBB")
					@@c2Alt = Gdk::Color.parse("#BBBB22")
				else
					@@c1 = Gdk::Color.parse("#2222EE")
					@@c2 = Gdk::Color.parse("#EE2222")
					@@c1Alt = Gdk::Color.parse("#5555FF")
					@@c2Alt = Gdk::Color.parse("#BB2222")
			end
			@@couleur1.set_bg(Gtk::STATE_PRELIGHT, @@c1.red, @@c1.green, @@c1.blue)
			@@couleur1.set_bg(Gtk::STATE_NORMAL, @@c1.red, @@c1.green, @@c1.blue)
			@@couleur2.set_bg(Gtk::STATE_PRELIGHT, @@c2.red, @@c2.green, @@c2.blue)
			@@couleur2.set_bg(Gtk::STATE_NORMAL, @@c2.red, @@c2.green, @@c2.blue)
			@@couleur1Alt.set_bg(Gtk::STATE_PRELIGHT, @@c1Alt.red, @@c1Alt.green, @@c1Alt.blue)
			@@couleur1Alt.set_bg(Gtk::STATE_NORMAL, @@c1Alt.red, @@c1Alt.green, @@c1Alt.blue)
			@@couleur2Alt.set_bg(Gtk::STATE_PRELIGHT, @@c2Alt.red, @@c2Alt.green, @@c2Alt.blue)
			@@couleur2Alt.set_bg(Gtk::STATE_NORMAL, @@c2Alt.red, @@c2Alt.green, @@c2Alt.blue)
			boutonCouleur1.set_color(@@c1)
			boutonCouleur2.set_color(@@c2)
			boutonCouleur1Alt.set_color(@@c1Alt)
			boutonCouleur2Alt.set_color(@@c2Alt)
		}

		boutonCouleur1.signal_connect('color-set'){
			@@c1 = boutonCouleur1.color
			@@couleur1.set_bg(Gtk::STATE_PRELIGHT, @@c1.red, @@c1.green, @@c1.blue)
			@@couleur1.set_bg(Gtk::STATE_NORMAL, @@c1.red, @@c1.green, @@c1.blue)
		}
		
		boutonCouleur2.signal_connect('color-set'){
			@@c2 = boutonCouleur2.color
			@@couleur2.set_bg(Gtk::STATE_PRELIGHT, @@c2.red, @@c2.green, @@c2.blue)
			@@couleur2.set_bg(Gtk::STATE_NORMAL, @@c2.red, @@c2.green, @@c2.blue)
		}
		
		boutonCouleur1Alt.signal_connect('color-set'){
			@@c1Alt = boutonCouleur1Alt.color
			@@couleur1Alt.set_bg(Gtk::STATE_PRELIGHT, @@c1Alt.red, @@c1Alt.green, @@c1Alt.blue)
			@@couleur1Alt.set_bg(Gtk::STATE_NORMAL, @@c1Alt.red, @@c1Alt.green, @@c1Alt.blue)
		}
		
		boutonCouleur2Alt.signal_connect('color-set'){
			@@c2Alt = boutonCouleur2Alt.color
			@@couleur2Alt.set_bg(Gtk::STATE_PRELIGHT, @@c2Alt.red, @@c2Alt.green, @@c2Alt.blue)
			@@couleur2Alt.set_bg(Gtk::STATE_NORMAL, @@c2Alt.red, @@c2Alt.green, @@c2Alt.blue)
		}
		
		
		boutonRetour = Gtk::Button.new(langue.retour)
		boutonRetour.signal_connect('clicked'){
			fenetre.remove(vbox)
			Menu.afficher(fenetre, langue)
		}

		boutonOptions = Gtk::Button.new(langue.options)
		boutonOptions.signal_connect('clicked'){
			fenetre.remove(vbox)
			Options.afficher(fenetre, langue)
		}

		label = Gtk::Label.new()
		label.set_markup(langue.og_1)

		hbox2 = Gtk::HBox.new(false,40)
		hbox2.add(Gtk::Label.new("Set: "))
		hbox2.add(set)

		boutonCouleur2Alt.set_size_request(100,100)
		boutonCouleur1Alt.set_size_request(100,100)
		boutonCouleur2.set_size_request(100,100)
		boutonCouleur1.set_size_request(100,100)
		label.set_size_request(0,175)
		boutonRetour.set_size_request(0,25)
		boutonOptions.set_size_request(0,25)

		vbox.add(label)
		vbox.add(hbox2)
		vbox1.add(Gtk::Label.new(langue.og_2))
		vbox1.add(boutonCouleur1)
		vbox1.add(boutonCouleur2)
		vbox2.add(Gtk::Label.new(langue.og_3))
		vbox2.add(boutonCouleur1Alt)
		vbox2.add(boutonCouleur2Alt)
		hbox.add(vbox1)
		hbox.add(vbox2)
		vbox.add(hbox)
		vbox.add(boutonOptions)
		vbox.add(boutonRetour)
		fenetre.add(vbox)
		fenetre.show_all
	end
end
