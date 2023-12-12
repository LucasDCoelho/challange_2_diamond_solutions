import "package:flutter/material.dart";
import '../components/custom_text_form_field.dart';

class AllNumbersUntilReach extends StatefulWidget {

  const AllNumbersUntilReach({super.key});

  @override
  State<AllNumbersUntilReach> createState() => _AllNumbersUntilReachState();
}

class _AllNumbersUntilReachState extends State<AllNumbersUntilReach> {
  final GlobalKey<FormState> _formNumbersUntilReachKey = GlobalKey<FormState>();
  final TextEditingController _numbersUntilReachController = TextEditingController();
  final List<int> _allNumbersList = [];
  int displayNumber = 0;


  void _numbersUntilReach() {
    int number = int.tryParse(_numbersUntilReachController.text) ?? 0;
    _allNumbersList.clear();
    for(int i = 1; i < number; i++){
      _allNumbersList.add(i);
    }
    setState(() {
      displayNumber = number;
      _allNumbersList;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Numeros até chegar no valor"),
        ),
        body: Form(
          key: _formNumbersUntilReachKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CustomTextFormField(
                  controller: _numbersUntilReachController,
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
                    visible: _allNumbersList != [] && displayNumber != 0,
                    child: Text(
                      "Números até ${displayNumber.toString()} : ",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Visibility(
                    visible: _allNumbersList != [],
                    child: Text(
                      _allNumbersList.join(", "),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                    onPressed: () {
                      if(_formNumbersUntilReachKey.currentState!.validate()){
                        _numbersUntilReach();
                        _numbersUntilReachController.clear();
                      }
                    },
                    child: const Text("Verificar")),
              )
            ],
          ),
        ));
  }
}
