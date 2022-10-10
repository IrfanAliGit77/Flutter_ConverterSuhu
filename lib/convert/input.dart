import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.etInput,
  }) : super(key: key);

  final TextEditingController etInput;

  @override
  Widget build(BuildContext context) {
    var WhitelistingTextInputFormatter;
    return TextFormField(
      controller: etInput,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan suhu dalam celcius terlebih dahulu !';
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: 'Masukkan Suhu Dalam Celcius',
      ),
      keyboardType: TextInputType.number,
    );
  }
}
