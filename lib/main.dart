import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Convertor',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Currency convertor'),
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

  final _controller = TextEditingController();
  String convertOutput = "";
  double pretEur = 4.8;
  double? input = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
        ),
        body: Column(
          children: <Widget>[
            Image.network("https://media.hotnews.ro/media_server1/image-2021-06-18-24869240-0-lei-romanesti.jpg",
                fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                    labelText: "Enter number of euros",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)
                    )
                ),
                onChanged: (String value){
                  setState(() {
                    input = double.tryParse(value);
                  });
                },
              ),
            ),
            ElevatedButton(onPressed:(){
              setState(() {
                convertOutput = "${double.parse((pretEur * input!).toStringAsFixed(2))}";
              });
            }, child: Text("Convert!")),
            Text("${convertOutput} RON",
              style: TextStyle(
                fontSize: 48,
              ),)
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
