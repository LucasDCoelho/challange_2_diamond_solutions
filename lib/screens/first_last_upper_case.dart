import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import '../components/custom_text_form_field.dart';

class FirstLastUpperCase extends StatefulWidget {

  const FirstLastUpperCase({super.key});

  @override
  State<FirstLastUpperCase> createState() => _FirstLastUpperCaseState();
}

class _FirstLastUpperCaseState extends State<FirstLastUpperCase> {
  final GlobalKey<FormState> _formFirstLastUpperCaseKey = GlobalKey<FormState>();
  final TextEditingController _firstLastUpperCaseController = TextEditingController();
  String _resultStringModify = "";

  void _showTheInverseString() {
    String stringOriginal = _firstLastUpperCaseController.text;
    String firstLetterStringUpperCase = stringOriginal.substring(0, 1).toUpperCase();
    String lastLetterStringUpperCase = stringOriginal.substring(stringOriginal.length - 1).toUpperCase();
    String restString = stringOriginal.substring(1, stringOriginal.length -1).toLowerCase();

    setState(() {
      _resultStringModify = firstLetterStringUpperCase + restString + lastLetterStringUpperCase;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mostar a primeira e ultima maiuscula", style: TextStyle(
            fontSize: 18,
          ),),
        ),
        body: Form(
          key: _formFirstLastUpperCaseKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CustomTextFormField(
                  controller: _firstLastUpperCaseController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: "Digite uma palavra",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty ) {
                      return "Por favor, digite uma palavra";
                    } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
                      return "Digite apenas letras";
                    } else {
                      return null;
                    }
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(23)
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text('String modificada: ' , style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),),
              const SizedBox(height: 16),
              Text(_resultStringModify , style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                    onPressed: () {
                      if(_formFirstLastUpperCaseKey.currentState!.validate()){
                        _showTheInverseString();
                        _firstLastUpperCaseController.clear();
                      }
                    },
                    child: const Text("Verificar")),
              )
            ],
          ),
        ));
  }
}
