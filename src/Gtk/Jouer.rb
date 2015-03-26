# encoding: UTF-8

class Jouer

	@plateau
	@plateauGtk

	def Jouer.afficher(fenetre, langue)
		boutonRetour = Gtk::Button.new(langue.retour)
		boutonReset = Gtk::Button.new('Reset')
		boutonRedo = Gtk::Button.new('Redo')
		boutonUndo = Gtk::Button.new('Undo')
		boutonTestGrille = Gtk::Button.new("Test")#a integrer dans la langue
		vbox = Gtk::VBox.new(false,10)

		fichier = File.open(PATH_GRI, "r")
#_____01______00______11__1_____0______0_1_____1_00___0___1__0_01_______0__________1____0___0_____1_______0__0_0____0__1______01_1_11___0________;
#110110100100100101010110011001101001110110010010001010101101010101011010101100110010001011001101110010011001010101100110001010101011101001010101
		stringDebut = "_____01______00______11__1_____0______0_1_____1_00___0___1__0_01_______0__________1____0___0_____1_______0__0_0____0__1______01_1_11___0________"
		stringFin = "110110100100100101010110011001101001110110010010001010101101010101011010101100110010001011001101110010011001010101100110001010101011101001010101"
		len = Math.sqrt(stringFin.length).to_i
		@plateau = Plateau.new(stringDebut,stringFin,boutonUndo,boutonRedo)
		@plateauGtk = PlateauGtk.creer(vbox,@plateau,len)
		
		boutonUndo.set_sensitive(false)
		boutonRedo.set_sensitive(false)
		
		boutonRetour.signal_connect('clicked'){
			fenetre.remove(vbox)
			Menu.afficher(fenetre, langue)
		}
		
		boutonUndo.signal_connect('clicked'){
			mouv=@plateau.undo
			if mouv.flag
				boutonUndo.set_sensitive(false)
			else
				boutonRedo.set_sensitive(true)
			end
			@plateauGtk.changerImgBouton(mouv.x,mouv.y,mouv.etatPrecedent)
		}
		
		boutonRedo.signal_connect('clicked'){
			mouv=@plateau.unundo
			if mouv.flag
				boutonRedo.set_sensitive(false)
			else
				boutonUndo.set_sensitive(true)
			end
			@plateauGtk.changerImgBouton(mouv.x,mouv.y,mouv.etatPrecedent)
		}

		boutonReset.signal_connect('clicked'){
			fenetre.remove(vbox)
			Jouer.afficher(fenetre, langue)
		}


		boutonTestGrille.signal_connect('clicked'){
			if(@plateau.testGrille)
				fenetre.remove(vbox)
				Credits.afficher(fenetre, langue)
			end
		}

		vbox.add(@plateauGtk.table)

		vbox.add(boutonTestGrille)
		vbox.add(boutonUndo)
		vbox.add(boutonRedo)
		vbox.add(boutonReset)
		vbox.add(boutonRetour)
		
		fenetre.add(vbox)
		fenetre.show_all
	end

	


end
