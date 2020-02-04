import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:app_calimax_convencion/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();

  //Flujo de datos - Streams
  //Stream - Firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;//Nos devuelve el estado del strem
  Stream<FirebaseUser> get authStatus => streamFirebase;//Moniorear el estado del stream cual es el estado



  //Casos uso
  //1. SignIn a la aplicación Google
  Future<FirebaseUser> signIn() {
    return _auth_repository.signInFirebase();
  }


  @override
  void dispose() {

  }
}