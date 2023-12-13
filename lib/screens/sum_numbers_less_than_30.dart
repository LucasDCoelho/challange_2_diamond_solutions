import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../components/custom_text_form_field.dart';

class SumNumberLessThan30 extends StatefulWidget {

  const SumNumberLessThan30({super.key});

  @override
  State<SumNumberLessThan30> createState() => _SumNumberLessThan30State();
}

class _SumNumberLessThan30State extends State<SumNumberLessThan30> {
  final GlobalKey<FormState> _formSumNumberLessThan30Key = GlobalKey<FormState>();
  final TextEditingController _sumNumberLessThan30Controller = TextEditingController();
  final maskFiveNumbers = MaskTextInputFormatter(
      mask: "#-#-#-#-#",
      filter: {"#": RegExp(r'[0-9]')}
  );
  int _result = 0;

  void _calculateSum() {
    String numbersString = _sumNumberLessThan30Controller.text;
    List<int> numbers = _parseNumbers(numbersString);

    int sum = _calculateSumLessThan30(numbers);

    setState(() {
      _result = sum;
    });

  }

  List<int> _parseNumbers(String numbersString) {
    List<String> numberStrings = numbersString.split("-");
    List<int> numbers = [];

    for (String numStr in numberStrings) {
      int num = int.tryParse(numStr) ?? 0;
      numbers.add(num);
    }

    return numbers;
  }

  int _calculateSumLessThan30(List<int> numbers) {
    int sum = 0;

    for (int number in numbers) {
      if (number < 30) {
        sum += number;
      }
    }

    return sum;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Soma dos numeros menor que 30", style: TextStyle(
            fontSize: 21,
          ),),
        ),
        body: Form(
          key: _formSumNumberLessThan30Key,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CustomTextFormField(
                  controller: _sumNumberLessThan30Controller,
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
                    maskFiveNumbers,
                    LengthLimitingTextInputFormatter(9)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Visibility(
                    visible: _result != 0,
                    child: Text(
                      "A soma dos numeros menores do que 30 é: \n"
                      "$_result",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                    onPressed: () {
                      if(_formSumNumberLessThan30Key.currentState!.validate()){
                        _calculateSum();
                        _sumNumberLessThan30Controller.clear();
                      }
                    },
                    child: const Text("Verificar")),
              )
            ],
          ),
        ));
  }
}
