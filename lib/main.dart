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
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple,
        onPrimary: Colors.white,
        onSurface: Colors.white,
        ),
        ),
      
      home: calculadoraIMC(),
    );
  }
}

class calculadoraIMC extends StatefulWidget {
  @override
  State<calculadoraIMC> createState() => _calculadoraIMCState();
}

class _calculadoraIMCState extends State<calculadoraIMC> {
  TextEditingController pesoController = TextEditingController(text:'');
  TextEditingController alturaController = TextEditingController(text:'');
  double? imc;
  String? classificacao ;
  Color? corResultado ;

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
            imc == null ? Text('Adicione valores de peso e altura para calcular seu IMC',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,):Container(
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
                    Text('Seu Peso',
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                    Container(
                      width: 75,
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: pesoController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixText: 'kg'
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 35,
                ),
                Column(
                  children: [
                    Text('Sua altura',
                    style: TextStyle(color: Colors.grey[300]),),
                    Container(
                      width: 75,
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: alturaController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixText:'M'
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(  
              width: 230,
              height: 50,
              child: ElevatedButton(onPressed: () {
                print(pesoController.text);
                print(alturaController.text);
              },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text(
                  'calcular',
                  style: TextStyle(
                    color:Colors.grey[300],
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
