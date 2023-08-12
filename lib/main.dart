import 'package:flutter/material.dart';
import 'package:hello_world_app/src/screens/couter/couter_functions_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light().copyWith(primary: Colors.blue),
      ),
      initialRoute: '/', // Ruta inicial
      routes: {
        '/': (context) => const WelcomeScreen(), // Página de inicio
        '/counter': (context) => const CounterFunctionsScreen(), // Página de contador
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("¡Explora el Conteo Mágico!"
),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenido  al Contador!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/counter'); // Navegar a la página de contador
              },
              child: const Text('Va mos'),
            ),
          ],
        ),
      ),
    );
  }
}
