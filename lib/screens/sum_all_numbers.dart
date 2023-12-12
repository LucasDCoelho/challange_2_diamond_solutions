import "package:flutter/material.dart";
import '../components/custom_text_form_field.dart';

class SumAllNumbers extends StatefulWidget {

  const SumAllNumbers({super.key});

  @override
  State<SumAllNumbers> createState() => _SumAllNumbersState();
}

class _SumAllNumbersState extends State<SumAllNumbers> {
  final GlobalKey<FormState> _formSumAllNumbersKey = GlobalKey<FormState>();
  final TextEditingController _numbersSumAllNumbersController = TextEditingController();
  int sumAllNumbers = 0;
  int displayNumber = 0;


  void _numbersUntilReach() {
    int number = int.tryParse(_numbersSumAllNumbersController.text) ?? 0;
    sumAllNumbers = 0;
    for(int i = 1; i < number; i++){
      sumAllNumbers += i;
    }
    setState(() {
      displayNumber = number;
      sumAllNumbers;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Soma dos numeros até o valor"),
        ),
        body: Form(
          key: _formSumAllNumbersKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CustomTextFormField(
                  controller: _numbersSumAllNumbersController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Digite um número positivo",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty ) {
                      return "Digite um numero!";
                    } else if (!RegExp(r"^\d+$").hasMatch(value)) {
                      return "Digite apenas número positivos";
                    } else{
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Visibility(
                    visible: sumAllNumbers != 0 && displayNumber != 0,
                    child: Text(
                      "A soma dos numeros menores que ${displayNumber.toString()} é: $sumAllNumbers",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                    onPressed: () {
                      if(_formSumAllNumbersKey.currentState!.validate()){
                        _numbersUntilReach();
                        _numbersSumAllNumbersController.clear();
                      }
                    },
                    child: const Text("Verificar")),
              )
            ],
          ),
        ));
  }
}
