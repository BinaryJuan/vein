import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
//import 'package:vein/views/login_view.dart';
//import 'package:vein/views/register_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://jxraecsjmytmlmihycmd.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4cmFlY3NqbXl0bWxtaWh5Y21kIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTM1Mjk1NTYsImV4cCI6MjAwOTEwNTU1Nn0.LIQVk85V6YpgVOrpOobwBaWWq8UrhZ9jAn_T_CM3tZ0',
  );

  runApp(MaterialApp(
      title: 'VEIN',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 150, 135, 7)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('VEIN')),
      backgroundColor: Color(0xFFF7BF50),
      
    );
  }
}