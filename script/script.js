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

function makeString()
{
    var text = "";
    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

    for( var i=0; i < (Math.floor(Math.random() * (7 - 3 + 1)) + 3); i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return text;
}

function getNumClasseRand(){
  var xmlhttp = new XMLHttpRequest();
      xmlhttp.open("GET", "classes/getNumClasseRandom.php", true);
      xmlhttp.send();
}

function insertEleve(str){
  var xmlhttp = new XMLHttpRequest();
        vars = "nom="+makeString()+"&prenom="+makeString()+"&naissance=2016-01-01&sexe=masculin";
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("main_menu").innerHTML = "insertion d'un élève avec des données aléatoires";
            }
        };
        xmlhttp.open("POST", "classes/insertEleve.php", true);
        xmlhttp.send(vars);

  console.log(str);
}

function supprimerEleve(){
  alert("BANG ! You are dead ! Not big surprise.");
}

function addEleve(){
  document.getElementById("main_menu").innerHTML="<div>Prenom:<br><input type='text' id='prenom' value=''><br>Nom:<br><input type='text' id='nom' value=''><br>Date de Naissance (aaaa-mm-dd):<br><input type='text' id='date' value=''><br>Sexe:<br><select id='sex' value=''><option value='masciu'>Masculin</option><option value='Feminin'>Féminin</option></select><br><button onClick='envoyerEleve();'>Envoyer</button></div> ";
}

function envoyerEleve(){
  var xmlhttp = new XMLHttpRequest();
    var vars = "nom="+document.getElementById('nom').value+"&prenom="+document.getElementById('prenom').value+"&date="+document.getElementById('date').value+"&sexe="+document.getElementById('sex').value+"";
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("main_menu").innerHTML = "insertion d'un élève dans la base";
        }
    };
    xmlhttp.open("POST", "classes/insertEleve.php", true);
    xmlhttp.send(vars);
}
