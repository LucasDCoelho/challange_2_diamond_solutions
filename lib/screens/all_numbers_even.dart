import "package:flutter/material.dart";
import '../components/custom_text_form_field.dart';

class AllNumbersEven extends StatefulWidget {

  const AllNumbersEven({super.key});

  @override
  State<AllNumbersEven> createState() => _AllNumbersEvenState();
}

class _AllNumbersEvenState extends State<AllNumbersEven> {
  final GlobalKey<FormState> _formAllNumbersEvenKey = GlobalKey<FormState>();
  final TextEditingController _allNumbersEvenController = TextEditingController();
  final List<int> _allNumbersList = [];
  int displayNumber = 0;

  void _numbersUntilReach() {
    int number = int.tryParse(_allNumbersEvenController.text) ?? 0;
    _allNumbersList.clear();
    for(int i = 1; i < number; i+=2){
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
          title: const Text("Mostrar os numero ímpares"),
        ),
        body: Form(
          key: _formAllNumbersEvenKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CustomTextFormField(
                  controller: _allNumbersEvenController,
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
                      "Números ímpares até ${displayNumber.toString()} : ",
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
                      if(_formAllNumbersEvenKey.currentState!.validate()){
                        _numbersUntilReach();
                        _allNumbersEvenController.clear();
                      }
                    },
                    child: const Text("Verificar")),
              )
            ],
          ),
        ));
  }
}
