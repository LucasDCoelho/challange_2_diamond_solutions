import "package:flutter/material.dart";
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../components/custom_text_form_field.dart';

class NumbersMoreThan50 extends StatefulWidget {

  const NumbersMoreThan50({super.key});

  @override
  State<NumbersMoreThan50> createState() => _NumbersMoreThan50State();
}

class _NumbersMoreThan50State extends State<NumbersMoreThan50> {
  final GlobalKey<FormState> _formNumbersMoreThan50Key = GlobalKey<FormState>();
  final TextEditingController _numbersMoreThan50Controller = TextEditingController();
  final maskFiveNumbers = MaskTextInputFormatter(
      mask: "##/##/##/##/##",
      filter: {"#": RegExp(r'[0-9]')}
  );
  List<int> _resultList = [];

  void _showNumberMoreThan50() {
    String numbersString = _numbersMoreThan50Controller.text;
    List<int> numbers = _parseNumbers(numbersString);

    List<int> numbersMoreThan50 = _getNumberMoreThan50(numbers);

    setState(() {
      _resultList = numbersMoreThan50;
    });

  }

  List<int> _parseNumbers(String numbersString) {
    List<String> numberStrings = numbersString.split("/");
    List<int> numbers = [];

    for (String numStr in numberStrings) {
      int num = int.tryParse(numStr) ?? 0;
      numbers.add(num);
    }

    return numbers;
  }

  List<int> _getNumberMoreThan50(List<int> numbers) {
    List<int> numbersMoreThan50 = numbers.where((number) => number > 50).toList();

    return numbersMoreThan50;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mostrar numeros maiores que 50", style: TextStyle(
            fontSize: 21,
          ),),
        ),
        body: Form(
          key: _formNumbersMoreThan50Key,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CustomTextFormField(
                  controller: _numbersMoreThan50Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Digite 5 números positivos",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty ) {
                      return "Digite um numero!";
                    } else {
                      return null;
                    }
                  },
                  inputFormatters: [
                    maskFiveNumbers
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Visibility(
                    visible: _resultList != [],
                    child: Text(
                      "A numeros maiores do que 50 é: \n"
                          "${_resultList.join(", ")}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                    onPressed: () {
                      if(_formNumbersMoreThan50Key.currentState!.validate()){
                        _showNumberMoreThan50();
                        _numbersMoreThan50Controller.clear();
                      }
                    },
                    child: const Text("Verificar")),
              )
            ],
          ),
        ));
  }
}
