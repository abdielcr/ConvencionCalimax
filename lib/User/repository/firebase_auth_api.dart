import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {

  final FirebaseAuth _auth = FirebaseAuth.instance;//La instancia de FirebaseAuth - toda la instancia
  final GoogleSignIn googleSignIn = GoogleSignIn();//La instancia de GoogleSignin

//Meto para conexion
  Future<FirebaseUser> signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();//Solicitando el cuadro de dialogo
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;//Obtenmos Credenciales

    FirebaseUser user = await _auth.signInWithCredential(
        GoogleAuthProvider.getCredential(idToken: gSA.idToken, accessToken: gSA.accessToken));
        //Utiliza las credenciales de google
    return user;

  }

}
