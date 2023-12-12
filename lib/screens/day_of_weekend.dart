import "package:flutter/material.dart";
import '../components/custom_text_form_field.dart';

class DaysOfWeekend extends StatefulWidget {

  const DaysOfWeekend({super.key});

  @override
  State<DaysOfWeekend> createState() => _DaysOfWeekendState();
}

class _DaysOfWeekendState extends State<DaysOfWeekend> {
  final GlobalKey<FormState> _formDaysKey = GlobalKey<FormState>();
  final TextEditingController _daysController = TextEditingController();
  String _result = '';

  final Map<int, String> days = {
    1: "Dominigo",
    2: "Segunda",
    3: "Terça",
    4: "Quarta",
    5: "Quinta",
    6: "Sexta",
    7: "Sábado",
  };

  void _adjustmentYourSalary() {
      int dayNumber = int.tryParse(_daysController.text) ?? 0;
      setState(() {
        _result = days[dayNumber]!;
      });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dias da semana"),
        ),
        body: Form(
          key: _formDaysKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CustomTextFormField(
                  controller: _daysController,
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Dia da Semana",
                      hintText: "Informe um número de 1 a 7",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty ) {
                      return "Digite um numero!";
                    } else if (!RegExp(r"^[1-7]$").hasMatch(value)) {
                      return "Digite um numero entre 1 e 7!";
                    } else{
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Visibility(
                    visible: _result != '',
                    child: Text(
                      _result.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                    onPressed: () {
                      if(_formDaysKey.currentState!.validate()){
                        _adjustmentYourSalary();
                        _daysController.clear();
                      }
                    },
                    child: const Text("Verificar")),
              )
            ],
          ),
        ));
  }
}
