import 'package:flutter/material.dart';
import 'package:app_calimax_convencion/widgets/gradient_back.dart';
import 'package:app_calimax_convencion/widgets/button_green.dart';
import 'package:app_calimax_convencion/widgets/button_blue.dart';
import 'package:app_calimax_convencion/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_calimax_convencion/platzi_trips_cupertino.dart';
import 'package:app_calimax_convencion/User/model/user.dart';

class SignInScreen extends StatefulWidget {

  @override
  State createState() {
    return _SignInScreen();
  }
}


class _SignInScreen extends State<SignInScreen> {

  UserBloc userBloc;
  double screenWidht;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    screenWidht = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot- data - Object User
        if(!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return PlatziTripsCupertino();
        }
      },
    );

  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(

        //   <--- image he
        alignment: Alignment.center,
        children: <Widget>[

          GradientBack(height: null),
          Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/img/caliexia.png',
                height: 200,
                width: 300,
                fit: BoxFit.fitWidth,),

              Center(

                child: Container(


                  child: Text("",
                    style: TextStyle(
                        fontSize: 35.0,
                        fontFamily: "Lato",
                        color: Colors.white,
                        fontWeight: FontWeight.bold


                    ),
                  ),
                ),
              ),
              ButtonGreen(text: "Inica con Gmail",
                onPressed: () {
                  userBloc.signOut();
                  userBloc.signIn().then((FirebaseUser user) {
                    userBloc.updateUserData(User(
                        uid: user.uid,
                        name: user.displayName,
                        email: user.email,
                        photoURL: user.photoUrl
                    ));
                  });

                },
                width: 300.0,
                height: 50.0,

              ),
              ButtonBlue(text: "Inicia con Facebook",
                onPressed: () {
                  userBloc.signOut();
                  userBloc.signIn().then((FirebaseUser user) {
                    userBloc.updateUserData(User(
                        uid: user.uid,
                        name: user.displayName,
                        email: user.email,
                        photoURL: user.photoUrl
                    ));
                  });

                },

                width: 300.0,
                height: 50.0,

              ),

              Image.asset(

                'assets/img/byexcel1.png',
                height: 100,
                width: 200,
                fit: BoxFit.fitWidth,
              ),
              Image.asset(

                'assets/img/byexcel2.png',
                height: 100,
                width: 200,
                fit: BoxFit.fitWidth,
              ),

              Image.asset(

                'assets/img/byexcel.png',
                height: 100,
                width: 200,
                fit: BoxFit.fitWidth,
              )

            ],

          ),

        ],

      ),

    );
  }


}