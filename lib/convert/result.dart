import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Result extends StatelessWidget {
  const Result({Key? key, 
      required this.result})
      :super(key: key);

  final double result ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top: 20,bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Text("Hasil",style: TextStyle(fontSize: 25),),
        Text(
          result.toStringAsFixed(2),
          style: const TextStyle(fontSize:35),
          )
        ],
      ),
    );
  }
}
