function showEleveMenu() {
        document.getElementById("main_menu").innerHTML="<div><ul><li id='vue_eleves' onclick='voirEleves();'>Voir eleves</li><li id='retour' onclick='retour();'>Retour</li></ul></div>";
        document.getElementById("main_menu").removeAttribute("onclick");
        console.log("showEleveMenu fired");
}

function retour(){
  location.reload();
}

function voirEleves(){
  var data;
  var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                data = (this.responseText);
                document.getElementById("main_menu").innerHTML = data;
            }
        };
        xmlhttp.open("GET", "classes/getEleves.php", true);
        xmlhttp.send();

  console.log(data);
}

function supprimerEleve(id){
  var xmlhttp = new XMLHttpRequest();
    var vars = "id="+id;
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            alert("Supression de l'élève");
        }
    };
    xmlhttp.open("POST", "classes/deleteEleve.php", true);
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlhttp.send(vars);
    voirEleves();
}

function getClasses(){
  var data;
  var xmlhttp = new XMLHttpRequest();
        //xmlhttp.onreadystatechange = function() {
        //    if (this.readyState == 4 && this.status == 200) {
                data = (this.responseText);
        //    }
        //};
        xmlhttp.open("GET", "classes/getClasses.php", true);
        xmlhttp.send();

  return data;

  console.log(data);
}

function getResponsables(){
  var data;
  var xmlhttp = new XMLHttpRequest();
        //xmlhttp.onreadystatechange = function() {
            //if (this.readyState == 4 && this.status == 200) {
                data = (this.responseText);
            //}
        //};
        xmlhttp.open("GET", "classes/getResponsables.php", true);
        xmlhttp.send();

  return data;

  console.log(data);
}

function addEleve(){
  var classes = getClasses();
  var responsables = getResponsables();
  document.getElementById("main_menu").innerHTML="<div>Prenom:<br><input type='text' id='prenom' value=''><br>Nom:<br><input type='text' id='nom' value=''><br>Date de Naissance (aaaa-mm-dd):<br><input type='text' id='date' value=''><br>Sexe:<br><select id='sex' value=''><option value='Masculin'>Masculin</option><option value='Feminin'>Féminin</option></select><br>" + classes + "<br>" + responsables + "<br><button onClick='envoyerEleve();'>Envoyer</button></div>";
}

function envoyerEleve(){
  var xmlhttp = new XMLHttpRequest();
    var vars = "nom="+document.getElementById('nom').value+"&prenom="+document.getElementById('prenom').value+"&date="+document.getElementById('date').value+"&sex="+document.getElementById('sex').value+"";
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("main_menu").innerHTML = "insertion d'un élève dans la base";
        }
    };
    xmlhttp.open("POST", "classes/insertEleve.php", true);
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlhttp.send(vars);
}
