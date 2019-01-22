import 'package:chat_app/login.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bienvenido"),centerTitle: true,),
      body: Center(child: Column(
        children: <Widget>[
          Text("¡Has ingresado  correctamente!"),
            RaisedButton(
              child: Text("Desloguear"),
              onPressed: Signin().salir,
            )
        ],
      ),),
    );
  }
}