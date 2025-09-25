# Sample
$ touch 1.pdf 2.pdf 3.pdf
$ touch pdf-in/4.pdf pdf-in/5.pdf pdf-in/6.pdf

# find
$ find . -type f -name "*.pdf"


# check files to delete before perform the action
$ find . -type f -name "*.pdf" -exec echo rm {} \;
# OUTPUT :
# rm ./pdf-in/6.pdf
# rm ./pdf-in/5.pdf
# rm ./pdf-in/4.pdf
# rm ./1.pdf
# rm ./3.pdf
# rm ./2.pdf

$ find . -type f -name "*.pdf" -exec echo rm {} +
# OUTPUT : rm ./pdf-in/6.pdf ./pdf-in/5.pdf ./pdf-in/4.pdf ./1.pdf ./3.pdf ./2.pdf


# {} is placeholder (symbole qui représente une valeur qui sera remplacée plus tard par quelque chose de concret).
# Permet d’écrire une commande générique sans connaître les fichiers à l’avance
# In our case : {} = chemin du fichier trouvé
