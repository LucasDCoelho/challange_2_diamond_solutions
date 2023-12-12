import "package:flutter/material.dart";
import '../components/custom_text_form_field.dart';

class OddOrEven extends StatefulWidget {
  const OddOrEven({super.key});

  @override
  State<OddOrEven> createState() => _OddOrEvenState();
}

class _OddOrEvenState extends State<OddOrEven> {
  final GlobalKey<FormState> _formOddKey = GlobalKey<FormState>();
  final TextEditingController _oddOrEvenController = TextEditingController();
  String _oddOrEvenResult = '';
  late int result = 0;

  void _isOddOrEven() {
    int number = int.tryParse(_oddOrEvenController.text) ?? 0;
    setState(() {
      _oddOrEvenResult = (number % 2 == 0) ? "Par" : "Ímpar";
      result = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("É ímpar ou par?"),
      ),
      body: Form(
        key: _formOddKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _oddOrEvenController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "ex: 5",
                    labelText: "É ímpar ou par?",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor digite um numero!";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Visibility(
                      visible: _oddOrEvenResult != '',
                      child: Text("$result, é  $_oddOrEvenResult", style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: ElevatedButton(
                      onPressed: () {
                        if(_formOddKey.currentState!.validate()) {
                          _isOddOrEven();
                          _oddOrEvenController.clear();
                        }
                      },
                      child: Text("Verificar")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
