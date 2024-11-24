# SafyPower WebApp

**R�alis� par : Nada Mankai**  
**Contact :** [nadamainkai@gmail.com](mailto:nadamainkai@gmail.com)

---

## Description du Projet
Ce projet vise � am�liorer la WebApp SafyPower en optimisant les performances, en �liminant les redondances de code, et en ajoutant de nouvelles fonctionnalit�s. Ces am�liorations visent � enrichir l�exp�rience utilisateur, simplifier la maintenance et r�pondre aux besoins des entreprises clientes.

**Lien Rapport : https://docs.google.com/document/d/1cfT8WF36B10lJl4SIEVyERJSqlJOAndpIkKVACFB8Mw/edit?usp=sharing**

---

## Travail R�alis�

### 1. Refactoring et Optimisation du Code
- **Suppression du Code Redondant :**
    - Fusion de layouts r�p�titifs (par exemple : `StatistiqueLayout`, `ProfileLayout`, `ContactLayout`) en un seul composant central : `AppLayout`.
    - Optimisation du composant `TopAppBar` pour afficher dynamiquement le titre des pages.

- **R�organisation et Externalisation :**
    - R�organisation de la structure du projet pour am�liorer la lisibilit�.
    - Externalisation des donn�es statiques hors du code source.

- **Am�lioration des Performances :**
    - Suppression des fichiers inutiles ou obsol�tes.
    - Optimisations pour r�duire le temps de chargement de l'application.

---

### 2. Fonctionnalit�s Ajout�es

#### Tableau de Bord Avanc�
- **Suivi des Capteurs de S�curit� :**
    - **D�tecteurs de fum�e :** Affichage en temps r�el de l��tat (actif/inactif).
    - **Alarme incendie :** Alertes visuelles en cas d�activation.
- **Surveillance des Capteurs de Temp�rature :**
    - Indicateurs en temps r�el pour surveiller les niveaux de temp�rature.
- **Statistiques en Temps R�el :**
    - Taux d�utilisation des casiers (en pourcentage).
    - Temps moyen d�utilisation des casiers.
      ![img_5.png](img_5.png)
      ![img_6.png](img_6.png)

#### Bouton ON/OFF Global
- **Fonctionnalit� :** Permet d�allumer/�teindre toutes les prises d�une station depuis l�application.
- **Modal de Confirmation :** Emp�che les actions accidentelles et am�liore l'exp�rience utilisateur.
- **Impact Graphique :**
    - Mise � jour automatique des taux de disponibilit� et d�utilisation dans les graphiques.
    - Synchronisation imm�diate des changements via un `StateProvider`.
      ![img_1.png](img_1.png)
---

### 3. R�vision de l�Onglet Utilisateur
- **Suppression des Sections Inutiles :**
    - Informations sur la carte bancaire, feedbacks, facturation.
- **Optimisation et Simplification :**
    - Mise en avant des informations essentielles (nom, identifiant utilisateur, r�le) sous forme de cartes.
    - Utilisation de widgets r�utilisables pour une maintenance simplifi�e.
- **Nouvelle Fonctionnalit� :**
    - Modification des donn�es personnelles directement dans l�application.
      ![img_2.png](img_2.png)
      ![img_4.png](img_4.png)
---

### 4. Refonte de la Section "Contact Us"
- Ajout d�un **modal de confirmation** apr�s l�envoi d�un commentaire.
- Interface plus intuitive et interactive pour une meilleure exp�rience utilisateur.
![img_7.png](img_7.png)
---

## Propositions d�Am�liorations

### 1. Suivi des �nergies Consomm�es par Prise
- **Graphiques Interactifs :** Affichage de la consommation �nerg�tique par prise sur une p�riode donn�e.
- **B�n�fices :** Optimisation �nerg�tique et planification de la maintenance.

### 2. Analyse et Pr�diction
- **Pr�diction de la Demande :** Int�gration de machine learning pour anticiper les pics d'utilisation.
- **D�tection d�Anomalies :** Identification automatique des comportements inhabituels.

### 3. Notifications Intelligentes
- **Alertes en Temps R�el :** Signaler les anomalies des capteurs ou une baisse critique de disponibilit�.

### 4. Historique et Export des Donn�es
- **Fonctionnalit� d�Exportation :** Rapports d�taill�s en formats PDF ou Excel.

### 5. Optimisation du Tableau de Bord
- **Personnalisation des Widgets :** R�organisation des graphiques selon les pr�f�rences des utilisateurs.

### 6. Gestion Financi�re et Reporting
- **Suivi des Co�ts en Temps R�el :** Estimation et facturation automatique bas�es sur la consommation.

### 7. Optimisation �nerg�tique
- **Mode �conomie d��nergie :** D�sactivation automatique des prises pendant les heures creuses.

### 8. Personnalisation Utilisateur
- **Pr�f�rences :** Langue, notifications, et affichage des donn�es selon les besoins individuels.

### 9. Surveillance et S�curit�
- **Vid�o en Temps R�el :** Int�gration � des cam�ras de surveillance.
- **Journal des Activit�s :** Suivi des actions avec horodatage.



---

## Conclusion
Les optimisations et fonctionnalit�s ajout�es renforcent la performance et l�exp�rience utilisateur de SafyPower. Les propositions d�am�lioration futures visent � rendre l�application encore plus robuste et personnalis�e pour les besoins des entreprises clientes.

---

## Contact
Nada Mankai  
? [nadamainkai@gmail.com](mailto:nadamainkai@gmail.com)  
