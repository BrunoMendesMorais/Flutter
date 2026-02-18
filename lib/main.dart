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
  late TextEditingController pesoController;
  late TextEditingController alturaController;

  double imc = 0;
  String classificacao = "Digite o peso e altura";
  Color corResultado = Colors.white;
  Color corFundo = Color.fromARGB(255, 0, 28, 50);

  @override
  void initState() {
    pesoController = TextEditingController(text:'');
    alturaController = TextEditingController(text:'');
    super.initState();
  }
  @override
  void dispose() {
    pesoController.dispose();
    alturaController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corFundo,
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
                border: Border.all(width: 6, color: corResultado),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${imc?.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 36, color: corResultado),
                  ),
                  Text(
                    '${classificacao}',
                    style: TextStyle(fontSize: 23, color: corResultado),
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
                try{
                  double peso = double.parse(pesoController.text);
                  double altura = double.parse(alturaController.text); 
                  setState(() {
                    imc = peso / (altura*altura);
                    classificacao = getClassificacaoIMC(imc);
                    corResultado = getCor(imc);
                    corFundo = getFundo(imc);
                  });
                }on Exception{
                   setState(() {
                    imc = 0;
                    classificacao = "Digite valores validos";
                    corResultado = Colors.lightBlueAccent;
                    corFundo = Color.fromARGB(255, 0, 28, 50);
                  });
                }
                
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
  String getClassificacaoIMC(double imc){
    if(imc <= 18.5){
      return 'Abaixo do peso';
    }
    if(imc <= 24.9){
      return 'Peso normal';
    }
    if(imc <= 29.9){
      return 'Sobrepeso';
    }
    if(imc <= 34.9){
      return 'Obsidade Grau I';
    }
    if(imc <= 39.9){
      return 'Obsidade Grau II';
    }
  return 'Obsidade Grau III';
  }
  Color getCor(double imc){
    if(imc <= 18.5){
      return Colors.red;
    }
    if(imc <= 24.9){
      return Colors.green;
    }
    if(imc <= 29.9){
      return Colors.yellow;
    }
    if(imc <= 34.9){
      return Colors.orange;
    }
    if(imc <= 39.9){
      return Colors.deepOrange;
    }
  return Colors.red;
  }
  Color getFundo(double imc){
    if(imc <= 18.5){
      return const Color.fromARGB(255, 33, 2, 0);
    }
    if(imc <= 24.9){
      return const Color.fromARGB(255, 0, 36, 0);
    }
    if(imc <= 29.9){
      return const Color.fromARGB(255, 45, 41, 0);
    }
    if(imc <= 34.9){
      return const Color.fromARGB(255, 46, 28, 0);
    }
    if(imc <= 39.9){
      return const Color.fromARGB(255, 37, 9, 0);
    }
  return const Color.fromARGB(255, 34, 2, 0);
  }
}
