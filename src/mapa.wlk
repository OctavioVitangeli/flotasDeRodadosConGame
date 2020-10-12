import wollok.game.*
import vehiculos.*


class Pared {
	 var property dureza = 3
	 var property position = game.origin()
	 var property image = "pareddura.jpg"
	 
	 method chocar(){ 
	 	dureza = 0.max(dureza - 1)
	 	if( self.dureza() == 2 ){self.image("pared2.png")}
	 	else self.image("pared3.jpg")
	 }
}	