import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();

  void pressButton(String value) {
    setState(() {
      _controller.text = _controller.text + value;
    });
  }

  void solution() {
    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_controller.text);
        ContextModel cm = ContextModel();
        var result = exp.evaluate(EvaluationType.REAL, cm);
        _controller.text = result.toString();
      } catch (e) {
        print(e);
      }
    });
  }

  void clear() {
    setState(() {
      _controller.clear();
    });
  }

  void backspace() {
    try {
      _controller.text =
          _controller.text.substring(0, _controller.text.length - 1);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            child: TextField(
              readOnly: true,
              controller: _controller,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              // Make the text field fill the container
              decoration: InputDecoration(
                border: InputBorder.none,
                // Remove any extra padding
                contentPadding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.075,
                  bottom: MediaQuery.of(context).size.height * 0.075,
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () => clear(),
                    child: const Text(
                      "C",
                      style: TextStyle(fontSize: 15, color: Colors.red),
                    )),
                TextButton(
                    onPressed: () => pressButton("%"),
                    child: const Text(
                      "%",
                      style: TextStyle(fontSize: 15, color: Colors.green),
                    )),
                TextButton(
                    onPressed: backspace,
                    child: const Icon(
                      Icons.backspace,
                      color: Colors.green,
                      size: 15,
                    )),
                TextButton(
                    onPressed: () => pressButton("/"),
                    child: const Text(
                      "/",
                      style: TextStyle(fontSize: 15, color: Colors.green),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () => pressButton("7"),
                    child: const Text(
                      "7",
                      style: TextStyle(fontSize: 15),
                    )),
                TextButton(
                    onPressed: () => pressButton("8"),
                    child: const Text(
                      "8",
                      style: TextStyle(fontSize: 15),
                    )),
                TextButton(
                    onPressed: () => pressButton("9"),
                    child: const Text(
                      "9",
                      style: TextStyle(fontSize: 15),
                    )),
                TextButton(
                    onPressed: () => pressButton("*"),
                    child: const Text(
                      "*",
                      style: TextStyle(fontSize: 15, color: Colors.green),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () => pressButton("4"),
                    child: const Text(
                      "4",
                      style: TextStyle(fontSize: 15),
                    )),
                TextButton(
                    onPressed: () => pressButton("5"),
                    child: const Text(
                      "5",
                      style: TextStyle(fontSize: 15),
                    )),
                TextButton(
                    onPressed: () => pressButton("6"),
                    child: const Text(
                      "6",
                      style: TextStyle(fontSize: 15),
                    )),
                TextButton(
                    onPressed: () => pressButton("-"),
                    child: const Text(
                      "-",
                      style: TextStyle(fontSize: 15, color: Colors.green),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () => pressButton("1"),
                    child: const Text(
                      "1",
                      style: TextStyle(fontSize: 15),
                    )),
                TextButton(
                    onPressed: () => pressButton("2"),
                    child: const Text(
                      "2",
                      style: TextStyle(fontSize: 15),
                    )),
                TextButton(
                    onPressed: () => pressButton("3"),
                    child: const Text(
                      "3",
                      style: TextStyle(fontSize: 15),
                    )),
                TextButton(
                    onPressed: () => pressButton("+"),
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 15, color: Colors.green),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () => pressButton("00"),
                    child: const Text(
                      "00",
                      style: TextStyle(fontSize: 15),
                    )),
                TextButton(
                    onPressed: () => pressButton("0"),
                    child: const Text(
                      "0",
                      style: TextStyle(fontSize: 15),
                    )),
                TextButton(
                    onPressed: () => pressButton("."),
                    child: const Text(
                      ".",
                      style: TextStyle(fontSize: 15),
                    )),
                TextButton(
                    onPressed: () => solution(),
                    child: const Text(
                      "=",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.green,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
