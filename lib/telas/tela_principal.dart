import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // isso é uma lista de texto, que contem o endereço das imagens
  List<String> images = ['assets/1.jpg', 'assets/2.jpg', 'assets/3.jpg'];

  List<int> imagemSelecionada = [0, 0, 0];

//int somatorio = 0 ;
double somatorio = 100.0;

  void sortear()
  {
    int i = 0;
    while (i < 5) {
      setState(() {
        imagemSelecionada[0] = Random().nextInt(2);
        imagemSelecionada[1] = Random().nextInt(2);
        imagemSelecionada[2] = Random().nextInt(2);
        //sleep(Duration(milliseconds: 500));
      });
      
      i++; // mesma coisa que i = i +1;
    }
  
    

    if (imagemSelecionada[0] == imagemSelecionada[1] && imagemSelecionada[1] == imagemSelecionada[2]) {

      /// aqui vai somar
      somatorio = somatorio + 100.0;

      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text("Parabens"),
          content: Text("voce ganhou"),  
        )
      );
    } 
     else {
      // aqui vai diminuir
  somatorio = somatorio - 100.0;
showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: Text("Que pena!"),
    content: Text("Tente novamente!") ,
  )
);
    }
  }

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width -30;
    final larguraImagem = larguraTela / 3;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "times do Rio de Janeiro",
          style: TextStyle(fontSize: 30, backgroundColor: Colors.blue),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          sortear();
        },
        child: Icon(Icons.catching_pokemon),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Row( //LINHA
            mainAxisAlignment: MainAxisAlignment.center, //alinhamento
            children: [ //FILHOSAdvertisement
              Image.asset(
                images[imagemSelecionada[0]],
                width: larguraImagem,
                height: 200,
              ),
              SizedBox(width: 15,),
              Image.asset(
                images[imagemSelecionada[1]],
                width: larguraImagem,
                height: 200,
              ),
              SizedBox(width: 15,),
              Image.asset(
                images[imagemSelecionada[2]],
                width: larguraImagem,
                height: 200,
              ),
            ],
          ),
          Text("Pontuação: " + somatorio.toString(), 
          style:TextStyle(fontSize: 30,color:Colors.blue,fontWeight: FontWeight.bold)  
          ,)
        ],
      ),

       

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}