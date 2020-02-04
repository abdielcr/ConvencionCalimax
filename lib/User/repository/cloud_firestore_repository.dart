import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_calimax_convencion/User/model/user.dart';
import 'package:app_calimax_convencion/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

}