import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_calimax_convencion/User/repository/firebase_auth_api.dart';

class AuthRepository {

  final _firebaseAuthAPI = FirebaseAuthAPI();//Creamos el oBjeto

  //Cachamos el usuario
  Future<FirebaseUser> signInFirebase() => _firebaseAuthAPI.signIn();

  //Cerramos la session
  signOut() => _firebaseAuthAPI.signOut();
}