import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController = TextEditingController();
  // variable to store the user session
  late final User? _user;
  late final Session? _session;

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
              const Text('Login'),
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
                      final res = await Supabase.instance.client.auth.signInWithPassword(email: email, password: password);
                      if (res.user == null || res.session == null) {
                        print('Sign in failed.');
                      } else {
                        print('Sign in successful.');
                        _user = res.user;
                        _session = res.session;
                      }
                    }
                    catch (e) {
                      print(e);
                    }
                  },
                  child: const Text('Log in')),
                ],
              )
            ],
          ))
    );
  }
}