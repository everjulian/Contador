import 'package:flutter/material.dart'; // 📦 Importación del paquete Flutter
// import 'dart:math'; // 🎲 Importación de la biblioteca para números aleatorios

void main() {
  runApp(const MyApp()); // 🚀 Inicio de la aplicación
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "¡Explora el Conteo Mágico!", // 🏆 Título de la aplicación
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterFunctionsScreen(), // 🏠 Pantalla de inicio
    );
  }
}

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({Key? key}) : super(key: key);

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0; // Contador de Clicks 
  List<String> phrases = [
    '🚀 Has empezado a contar',
    '👍 Llevas 1 Clicks , ¡sigue así!', 
    '🎉 ¡2 Clicks ! Vamos en marcha', 
    '🔥 Llevas 3 Clicks , ¡sigue contando!', 
  ];

  String getPhrase(int number) {
    if (number < phrases.length) {
      return phrases[number]; // Obtener frase de acuerdo al número de Clicks 
    }
    return 'Llevas $number Clicks '; // Frase genérica
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "¡Explora el Conteo Mágico!"), // 📋 Título de la barra de la aplicación
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded), // 🔄 Icono de reinicio
            onPressed: () {
              setState(() {
                clickCounter = 0; // Reiniciar contador de Clicks 
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter', // Mostrar el número de Clicks 
              style:
                  const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text(
              getPhrase(
                  clickCounter), // Mostrar la frase según el número de Clicks 
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.plus_one,
            onPressed: () {
              setState(() {
                clickCounter++; // Incrementar contador de Clicks 
              });
            },
          ),
          const SizedBox(height: 10),
          CustomButton(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: () {
              if (clickCounter == 0) return;
              setState(() {
                clickCounter--; // Decrementar contador de Clicks 
              });
            },
          ),
          const SizedBox(height: 10),
          CustomButton(
            icon: Icons.refresh_rounded,
            onPressed: () {
              setState(() {
                clickCounter = 0; // Reiniciar contador de Clicks 
              });
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      enableFeedback: true,
      elevation: 8,
      onPressed: onPressed, // Función que se ejecuta al presionar el botón
      child: Icon(icon), // Ícono del botón
    );
  }
}
