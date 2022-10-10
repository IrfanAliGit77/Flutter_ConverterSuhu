import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'convert/result.dart';
import 'convert/input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 3 - Converter Suhu',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Konverter Suhu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController etInput = new TextEditingController();

  //Menentukan variabel input
  double input = 0;
  double result = 0;
  double celci = 0;
  double kelv = 0;
  double fahren = 0;
  double ream = 0;

  // Membuat variabel list dropdown suhu
  var satuanSuhu = ["Kelvin", "Reamur", "Fahrenheit"];
  String selected = "Kelvin";
  List<String> hasil = [];
  final formKey = GlobalKey<FormState>();

  // Melakukan konversi
  konversi() {
    //dengan state
    setState(
      () {
        if (formKey.currentState!.validate()) {
          // ignore: avoid_print
          print(hasil.length);
          input = double.parse(etInput.text);
          switch (selected) {
            case "Kelvin":
              {
                // statements;
                result = input + 273.15;
                hasil.add("Hasil Konversi " +
                    "$input" +
                    " ke Kelvin = " +
                    "$result");
              }
              break;

            case "Reamur":
              {
                //statements;
                result = input * 4 / 5;
                hasil.add("Hasil Konversi " +
                    "$input" +
                    " ke Reamur = " +
                    "$result");
              }
              break;

            case "Fahrenheit":
              {
                //statements;
                result = 9 / 5 * input + 32;
                hasil.add("Hasil Konversi " +
                    "$input" +
                    " ke Fahrenheit = " +
                    "$result");
                ;
              }
              break;
          }
        }
      },
    );
    // celcius = double.parse(etInput.text);
    // reamur = 4 / 5 * celcius;
    // fahrenheit = (9 / 5 * celcius) + 32;
    // kelvin = 273.15 + celcius;
  }

  // Membuat Dropdown values
  DropdownChanged(value) {
    setState(() {
      selected = value.toString();
    });
    konversi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Form(
                      key: formKey,
                      child: Input(etInput: etInput),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        child: DropdownButton(
                          items: satuanSuhu.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: selected,
                          onChanged: DropdownChanged,
                          isExpanded: true,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Result(
                          result: result,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 100),
                          ),
                          onPressed: konversi,
                          child: const Text(
                            'Konversi Suhu',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "Riwayat Konversi",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: hasil.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            hasil[index],
                            style: const TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
