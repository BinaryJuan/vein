import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vein/views/login_view.dart';
import 'package:vein/views/register_view.dart';
import 'dart:developer' as devtools show log; // CONSOLE LOG

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://jxraecsjmytmlmihycmd.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4cmFlY3NqbXl0bWxtaWh5Y21kIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTM1Mjk1NTYsImV4cCI6MjAwOTEwNTU1Nn0.LIQVk85V6YpgVOrpOobwBaWWq8UrhZ9jAn_T_CM3tZ0',
  );

  runApp(MaterialApp(
      title: 'VEIN',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 150, 135, 7)),
        useMaterial3: true,
      ),
      home: const AuthWrapper(),
      // RUTAS
      routes: {
        '/login/': (context) => const LoginView(),
        '/register/': (context) => const RegisterView(),
      },
    ));
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//     Widget build(BuildContext context) {
//       return FutureBuilder(
//         // future: Supabase.initialize(url: 'https://jxraecsjmytmlmihycmd.supabase.co', anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4cmFlY3NqbXl0bWxtaWh5Y21kIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTM1Mjk1NTYsImV4cCI6MjAwOTEwNTU1Nn0.LIQVk85V6YpgVOrpOobwBaWWq8UrhZ9jAn_T_CM3tZ0'),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           devtools.log('Initializing Supabase'); // LOG
//           switch (snapshot.connectionState) {
//             case ConnectionState.done:
//               if (snapshot.hasError) {
//                 return const Text('Error initializing Supabase');
//               }
//               return const NotesView();
//             default:
//               return const Center(child: CircularProgressIndicator());
//           }
//         },
//       );
//     }
// }

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    devtools.log(Supabase.instance.client.auth.currentUser.toString()); // LOG
    if (user == null) {
      return const LoginView();
    } else {
      return const NotesView();
    }
  }
}

// HOME PAGE (logged in)
class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    devtools.log('Building NotesView'); // LOG
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome back [NAME]!')
      ),
      backgroundColor: const Color(0xFFF7BF50),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('VEIN'),
            TextButton(
              onPressed: () {
                devtools.log('Logging out'); // LOG
                Supabase.instance.client.auth.signOut();
                Navigator.pushNamed(context, '/login/');
              }
            , child: const Text('Logout'))
          ],
        ),
      ),

    );
  }
}