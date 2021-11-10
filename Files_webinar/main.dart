import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DiceApp-Demo-Flutter',

      theme:ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage();

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var imageArray = [
    'dice-1.png',
    'dice-2.png',
    'dice-3.png',
    'dice-4.png',
    'dice-5.png',
    'dice-6.png'
  ];
  // the result which will be displayed on the screen
  int bet_amount=10;
  int balance = 100;

  // // Create a text controller  to retrieve the value
  final textController = TextEditingController();

  int randomIntForDiceOne = Random().nextInt(6);
  int randomIntForDiceTwo = Random().nextInt(6);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Dice App'),
        ),
        backgroundColor: Colors.white70,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(21, 50, 21, 50),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child:  TextField(
                  decoration: new InputDecoration.collapsed(
                      hintText: 'Choose bet amount'
                  ),
                  controller: textController,

                  keyboardType: TextInputType.numberWithOptions(decimal: false),

                ),
              ),
              ElevatedButton(onPressed: setBetAmount, child: Text('Submit')),
              // The user will type something here
              Padding(
                padding: const EdgeInsets.only(top:20,bottom: 40),
                child: Text('Account Balance: ' +
                    (balance).toString(),

                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              // The user will type something here



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset(
                    'images/' + imageArray[randomIntForDiceOne], height: 150,
                    width: 150,),
                  Image.asset(
                    'images/' + imageArray[randomIntForDiceTwo], height: 150,
                    width: 150,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(onPressed: updateBalance,
                  child: Text('Roll'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10 ,bottom:20),
                child: Text('Rolled amount: ' +
                    (randomIntForDiceOne + randomIntForDiceTwo + 2).toString(),

                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }


  void changeImage() {
    setState(() {
      randomIntForDiceOne = Random().nextInt(6);
      randomIntForDiceTwo = Random().nextInt(6);
    });
  }
  void setBetAmount() {
    // textController.text is a string and we have to convert it to double
    final enteredNumber = int.parse(textController.text);
    setState(() {
      bet_amount = enteredNumber;
    });
    print(enteredNumber);
  }
  void updateBalance() {
    setState(() {
      if ((randomIntForDiceOne + randomIntForDiceTwo) % 2 == 0) {
        balance = balance + bet_amount;
      }
      if ((randomIntForDiceOne + randomIntForDiceTwo) % 2 != 0) {
        balance = balance - bet_amount;
      }
      changeImage();
    }
    );
  }
}




