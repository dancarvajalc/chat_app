import 'package:chat_app/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class Bienvenida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Bienvenido al súper chat"),
        centerTitle: true,
      ),
      body: IngresoUI(),
    );
  }
}

class IngresoUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key("key"),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SignInButton(
              Buttons.Google,
              onPressed: Signin().ingresar,
            ),
          
          ],
        ),
      ),
    );
  }
}

class Signin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<FirebaseUser> ingresar() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    FirebaseUser usuario = await _auth.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    print(usuario.displayName);

    Navigator.push(scaffoldKey.currentContext,
        MaterialPageRoute(builder: (BuildContext context) => Home()));

    return usuario;
  }

  void salir() {
    googleSignIn.signOut();
    print("Usuario deslogeado");
  }
}
