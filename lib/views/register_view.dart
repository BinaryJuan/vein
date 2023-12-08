import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() { // esto hace que se inicialicen las variables cuando se crea el widget
    super.initState();
  }

  @override
  void dispose() { // esto hace que se eliminen las variables cuando se destruye el widget
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: const Color(0xFFF7BF50),
      body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('VEIN'),
              const Text('Register'),
              SizedBox(
                width: 350,
                child: 
                  TextField(
                    controller: _emailController, // el error es porque no se ha inicializado la variable
                    decoration: const InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: Color(0xFFD9D9D9),
                  ),
              )
              ),
              SizedBox(
                width: 350,
                child: 
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Color(0xFFD9D9D9),
                  ),
              )
              ),
              OverflowBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlinedButton(
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    try {
                      await Supabase.instance.client.auth.signUp(email: email, password: password);
                    }
                    catch (e) {
                      if (kDebugMode) {
                        print(e);
                      }
                    }
                  },
                  child: const Text('Sign up')),
                ],
              )
            ],
          ))
    );
  }
}