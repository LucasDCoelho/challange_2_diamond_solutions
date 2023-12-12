import "package:flutter/material.dart";
import '../components/custom_text_form_field.dart';

class TheGreaterThen extends StatefulWidget {

  const TheGreaterThen({super.key});

  @override
  State<TheGreaterThen> createState() => _TheGreaterThenState();
}

class _TheGreaterThenState extends State<TheGreaterThen> {
  final GlobalKey<FormState> _formGreaterKey = GlobalKey<FormState>();
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();
  String _greatThenResult = "";

  void _isTheGreaterThen() {
    int? number1 = int.tryParse(_number1Controller.text) ?? 0;
    int? number2 = int.tryParse(_number2Controller.text) ?? 0;
    setState(() {
      if (number1 > number2) {
        _greatThenResult =
        "${number1.toString()} é maior que ${number2.toString()}";
      } else {
        _greatThenResult =
        "${number2.toString()} é maior que ${number1.toString()}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Qual é maior")
        ),
        body:
        Form(
          key: _formGreaterKey,
          child: Column(
            children: [
              CustomTextFormField
                (controller: _number1Controller,
                keyboardType:TextInputType.number,
                decoration: InputDecoration(
                  labelText:"Qual é o maior? ex: 5",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor digite um numero!";
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                controller: _number2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "ex: 6",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor digite um numero!";
                  }
                  return null;
                },
              ),
              Visibility(
                  visible: _greatThenResult != '',
                  child: Text("$_greatThenResult")),
              ElevatedButton(
                  onPressed: () {
                    if(_formGreaterKey.currentState!.validate()){
                      _isTheGreaterThen();
                      _number1Controller.clear();
                      _number2Controller.clear();
                    }

                  },
                  child: const Text("Verificar"))
            ]
            ,
          ),
        )
    );
  }
}
