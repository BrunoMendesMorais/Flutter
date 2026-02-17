import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: calculadoraIMC(),
    );
  }
}

class calculadoraIMC extends StatefulWidget {
  @override
  State<calculadoraIMC> createState() => _calculadoraIMCState();
}

class _calculadoraIMCState extends State<calculadoraIMC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 28, 50),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                border: Border.all(width: 6, color: Colors.lightGreen),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '24.22',
                    style: TextStyle(fontSize: 36, color: Colors.lightGreen),
                  ),
                  Text(
                    'Peso normal',
                    style: TextStyle(fontSize: 23, color: Colors.lightGreen),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Seu Peso'),
                    Container(
                      width: 75,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixText: 'kg'
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 24,
                ),
                Column(
                  children: [
                    Text('Sua altura'),
                    Container(
                      width: 75,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixText:'M'
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(  
              width: 250,
              height: 50,
              child: ElevatedButton(onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text(
                  'calcular',
                  style: TextStyle(
                    color:Colors.white
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
