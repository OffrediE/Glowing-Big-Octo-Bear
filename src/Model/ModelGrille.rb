class ModelGrille


	##
	# Renvoie un objet grille aléatoirement choisit sur les critères de difficulte et de taille
	# Paramètres::
	# - difficulte : la difficulte choisie
	# - taille : la taille choisie
	# Retour::
	# - grille : une grille
	def ModelGrille.getRandomGrille(difficulte,taille)
		ary = $database.execute "SELECT * FROM Grille WHERE difficulte = #{difficulte} AND taille = #{taille} ORDER BY RANDOM() LIMIT 1"

		if ary.empty?
			return nil
		end

		grille = Grille.new(
	    	ary[0]["id_grille"],
	    	ary[0]['taille'],
	    	ary[0]['difficulte'],
	    	ary[0]['base'],
	    	ary[0]['solution'])
		return grille;
	end

	##
	# Renvoie l'objet Grille correspondant à l'id
	# Paramètres::
	# - id : id de la grille voulue
	# Retour::
	# - grille : une grille
	def ModelGrille.getGrilleById(id)
		ary = $database.execute "SELECT * FROM Grille WHERE id_grille = #{id}"

		if ary.empty?
			return nil
		end

		grille = Grille.new(
	    	ary[0]["id_grille"],
	    	ary[0]['taille'],
	    	ary[0]['difficulte'],
	    	ary[0]['base'],
	    	ary[0]['solution'])
		return grille;
	end

	##
	# Renvoie l'objet Grille correspondant à la difficulte et taille choisie
	# Paramètres::
	# - difficulte : la difficulte choisie
	# - taille : la taille choisie
	# Retour::
	# - grille : une grille
	def ModelGrille.getGrilleByDifficulteAndTaille(difficulte, taille)
		ary = $database.execute "SELECT * FROM Grille WHERE difficulte = #{difficulte} AND taille = #{taille} ORDER BY RANDOM() LIMIT 1"

		if ary.empty?
			return nil
		end

		temp = ary[0]["id_grille"]
		return temp;
	end

	##
	# Renvoie l'ensemble des difficultes disponibles
	# Retour::
	# - temp : un array contenant les difficulte
	def ModelGrille.getDifficulte()
		ary = $database.execute "SELECT difficulte FROM Grille GROUP BY difficulte"

		if ary.empty?
			return nil
		end

		temp = Array.new()
		ary.each{|x|
			temp.push(x['difficulte'])
		}
		return temp;
	end

	##
	# Renvoie l'ensemble des tailles disponibles
	# Retour::
	# - temp : un array contenant les tailles
	def ModelGrille.getTaille()
		ary = $database.execute "SELECT taille FROM Grille GROUP BY taille"

		if ary.empty?
			return nil
		end

		temp = Array.new()
		ary.each{|x|
			temp.push(x['taille'])
		}
		return temp;
	end

end