import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  num result = 0;
  TextEditingController numController = TextEditingController();
  void calcluateSquare() {
    num numInput = num.parse(numController.text.trim());
    setState(() {
      result = numInput * numInput;
    });
  }

  int counter = 0;
  void incremenet() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Counter Page")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextField(
            //   controller: numController,
            //   keyboardType: TextInputType.number,
            // ),
            // ElevatedButton(
            //   key: Key("btn1"),
            //   onPressed: calcluateSquare,
            //   child: Text('Calcuate'),
            // ),
            // Text("Result Value", style: TextStyle(fontSize: 20)),
            // Text(
            //   '$result',
            //   style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            // ),
            // Text("Counter Value", style: TextStyle(fontSize: 20)),
            Center(
              child: Text(
                '$counter',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            // const SizedBox(height: 20),
            // ElevatedButton(
            //   key: Key("btn2"),
            //   onPressed: incremenet,
            //   child: Text('Add'),
            // ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          key: const Key("increment"),
          onPressed: incremenet,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
