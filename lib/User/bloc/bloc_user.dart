
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:app_calimax_convencion/User/model/user.dart';
import 'package:app_calimax_convencion/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_calimax_convencion/User/repository/cloud_firestore_repository.dart';


class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();

  //Flujo de datos - Streams
  //Stream - Firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;


//Casos uso
  //1. SignIn a la aplicación Google
  Future<FirebaseUser> signIn() {
    return _auth_repository.signInFirebase();
  }

  //2. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);

  signOut() {
    _auth_repository.signOut();
  }


  @override
  void dispose() {

  }
}