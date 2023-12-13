import "package:flutter/material.dart";
import '../components/custom_text_form_field.dart';

class InverseString extends StatefulWidget {

  const InverseString({super.key});

  @override
  State<InverseString> createState() => _InverseStringState();
}

class _InverseStringState extends State<InverseString> {
  final GlobalKey<FormState> _formInverseStringKey = GlobalKey<FormState>();
  final TextEditingController _inverseStringController = TextEditingController();
  String _stringOriginal = "";
  String _stringInvertida = "";

  void _showTheInverseString() {
      String stringOriginal = _inverseStringController.text;
      String stringInvertida = "";

      for (int i = stringOriginal.length - 1; i >= 0; i--){
        stringInvertida += stringOriginal[i];
      }

      setState(() {
        _stringOriginal = stringOriginal;
        _stringInvertida = stringInvertida;
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mostrar uma string invertida", style: TextStyle(
            fontSize: 21,
          ),),
        ),
        body: Form(
          key: _formInverseStringKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CustomTextFormField(
                  controller: _inverseStringController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: "Digite uma frase ou palavra",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty ) {
                      return "Por favor, digite uma frase ou palavra";
                    } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
                      return "Digite apenas letras";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text('String Original: $_stringOriginal', style: const TextStyle(
                fontSize: 18,
              ),),
              const SizedBox(height: 8),
              Text('String Invertida: $_stringInvertida' , style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                    onPressed: () {
                      if(_formInverseStringKey.currentState!.validate()){
                        _showTheInverseString();
                        _inverseStringController.clear();
                      }
                    },
                    child: const Text("Verificar")),
              )
            ],
          ),
        ));
  }
}
