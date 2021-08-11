import 'package:flutter/material.dart';


class Login extends StatelessWidget {

  void onPressed () {
    // auth && and redirect page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome", style: Theme.of(context).textTheme.headline4 ),
              TextFormField(decoration: const InputDecoration(
                icon: Icon(Icons.account_circle_rounded),
                labelText: "UserName",
              )),
              TextFormField(decoration: const InputDecoration(
                icon: Icon(Icons.password),
                labelText: "Password",
              ),
              obscureText: true),
              const SizedBox(height: 24),
              ElevatedButton(onPressed: onPressed, child: Text("Let's go"))
            ],
        )
      )
    ));
  }
}