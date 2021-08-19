import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Login extends StatelessWidget {
  void onPressed(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/catalog");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                padding: const EdgeInsets.all(70.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome",
                        style: Theme.of(context).textTheme.headline4),
                    TextFormField(
                        decoration: const InputDecoration(
                      icon: Icon(Icons.account_circle_rounded),
                      labelText: "UserName",
                    )),
                    TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.password),
                          labelText: "Password",
                        ),
                        obscureText: true),
                    const SizedBox(height: 24),
                    ElevatedButton(
                        onPressed: () => onPressed(context),
                        child: Text("Let's go"))
                  ],
                ))));
  }
}
