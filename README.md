# Compte-Rendu Info706_JEE_TP (SAVAETE RAFFORT)

## Remarque

Si vous avez des problèmes lors de votre utilisation de l'application, n'hésitez pas à nous
en informer, cela n'est pas normal, tout fonctionne.

## Choix d'implantation :


### EJB Colis

```
public Colis addColis(double poids, double valeur, String origine, String destination, double latitude, double longitude, String emplacement, Etat etat);
	
public Colis findColis(double id);

public List<Colis> findAllColis();

public List<HistoryColis> findHistory(long id);

public HistoryColis addHistoryColis(long id, double latitude, double longitude, String emplacement,
    Etat etat);


public void editColis(long id, double latitude, double longitude, String emplacement, Etat etat);

public void deleteColis(long id);
 ```

### Servlets

Les fichiers **ShowServlet** sont les fichiers qui affichent les différentes pages.
_AddServlet_ et _EditServlet_ servent respectivement a ajouter un colis et à le modifier.

### Entités JPA

Il y a également deux entités JPA :
- _Colis_  qui contient les données des colis actuel
- _HistoryColis_ qui correspond aux différentes modification du suivi de colis

### Énumération

Nous avons également une énumération _Etat_ avec les états suivants : ENREGISTREMENT, EN_ATTENTE, EXPEDIE, BLOQUE, LIVRE

### Vues JSP

- _index.jsp_ : Page d'accueil
- _ajoutColis.jsp_ : **_/add_** Formulaire permettant l'ajout d'un nouveau colis (réalisé avec Bootstrap pour le design et Ajax JQuery pour le traitement en méthode POST)
- _editColis.jsp_ : **_/show?id=_** Formulaire d'édition d'un colis avec son identifiant en url et tableau de l'historique du colis
- _showColis.jsp_ : **_/follow_** Tableau de tous les colis avec les boutons d'édition et de suppression : On peut cliquer sur les coordonnées pour nous rediriger vers Google Maps



Nous avons décidé de faire ces choix d'implantation car c'est celui qui nous semblait le plus logique.


## Comment utiliser l'application :

1. Lancer votre serveur.
2. Lancer ensuite le projet sur le serveur. 
3. Sur la page d'acceuil vous pouvez saisir un numéro de suivie mais cela ne fais rien. Cependant, vous pouvez
cliquez sur "Ajoutez colis". Cela vous ménera à la page d'ajout d'un colis. Après quoi
vous pouvez suivre vos différents colis. De là, vous pouvez les modifier et les supprimer.
