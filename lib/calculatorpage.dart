import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  var userInput = '';
  var answer = '0';

  final List<String> buttons = [
    'C',
    'DEL',
    '+',
    '-',
    '7',
    '8',
    '9',
    '=',
    '4',
    '5',
    '6',
    '.',
    '1',
    '2',
    '3',
    '0',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 70), // Adding some space at the top
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      userInput,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      answer,
                      style: TextStyle(
                        fontSize: 55,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: 20), // Adding some space between display and buttons
            Container(
              height: 400,
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                physics:
                    NeverScrollableScrollPhysics(), // Disable GridView scrolling
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return MyButton(
                    buttonText: buttons[index],
                    color: isOperator(buttons[index])
                        ? Colors.black
                        : Colors.grey.withOpacity(0.3),
                    textColor: isOperator(buttons[index])
                        ? Colors.white
                        : Colors.black,
                    buttontapped: () {
                      buttonPressed(buttons[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isOperator(String o) {
    return o == '+' || o == '-' || o == '=';
  }

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        userInput = '';
        answer = '0';
      } else if (buttonText == 'DEL') {
        userInput = userInput.substring(0, userInput.length - 1);
      } else if (buttonText == '=') {
        equalPressed();
      } else {
        userInput += buttonText;
      }
    });
  }

  void equalPressed() {
    String finalUserInput = userInput;

    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}

class MyButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String buttonText;
  final Function() buttontapped;

  MyButton({
    required this.color,
    required this.textColor,
    required this.buttonText,
    required this.buttontapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
