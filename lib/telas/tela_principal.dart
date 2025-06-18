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

  void sortear()
  {
int i = 0 ; 
while(i < 5 ){





    setState(() {
      imagemSelecionada[0] = Random().nextInt(images.length);
      imagemSelecionada[1] = Random().nextInt(images.length);
      imagemSelecionada[2] = Random().nextInt(images.length);
sleep(Duration(milliseconds:500));
    });

    i++;

  } 
}

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width - 30;
    final larguraImagem = larguraTela / 3;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Baleia",
          style: TextStyle(
            fontSize: 30,
            backgroundColor: const Color.fromARGB(255, 247, 247, 247),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 23, 30, 36),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {

          sortear();
        },
        child: Icon(Icons.next_plan_sharp),
        backgroundColor: const Color.fromARGB(255, 23, 30, 36),
        foregroundColor: const Color.fromARGB(255, 224, 220, 220),
      ),
      body: Column(
        children: [
          Row(
            //LINHA
            mainAxisAlignment: MainAxisAlignment.center, //alinhamento
            children: [
              //FILHOS
              Image.asset(
                images[imagemSelecionada[0]],
                width: larguraImagem,
                height: 200,
              ),
              SizedBox(width: 15),
              Image.asset(
                images[imagemSelecionada[1]],
                width: larguraImagem,
                height: 200,
              ),
              SizedBox(width: 15),
              Image.asset(
                images[imagemSelecionada[2]],
                width: larguraImagem,
                height: 200,
              ),
            ],
          ),
        ],
      ),


      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
