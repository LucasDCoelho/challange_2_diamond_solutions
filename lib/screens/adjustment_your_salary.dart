import "package:flutter/material.dart";
import '../components/custom_text_form_field.dart';

class AdjustmentYourSalary extends StatefulWidget {

  const AdjustmentYourSalary({super.key});

  @override
  State<AdjustmentYourSalary> createState() => _AdjustmentYourSalaryState();
}

class _AdjustmentYourSalaryState extends State<AdjustmentYourSalary> {
  final GlobalKey<FormState> _formAdjustmentKey = GlobalKey<FormState>();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _adjustmentController = TextEditingController();
  double _adjustmentYourSalaryResult = 0.0;

  void _adjustmentYourSalary() {
    double number = double.tryParse(_salaryController.text) ?? 0;
    double percentual = double.tryParse(_adjustmentController.text) ?? 0;
    setState(() {
      _adjustmentYourSalaryResult = number + (number * (percentual / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ajuste de salário"),
        ),
        body: Form(
          key: _formAdjustmentKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CustomTextFormField(
                  controller: _salaryController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Salário",
                      prefixText: "R\$",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor digite o seu salario!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CustomTextFormField(
                  controller: _adjustmentController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Digite o percentual de reajuste",
                      suffixText: "%",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor digite um numero!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Visibility(
                    visible: _adjustmentYourSalaryResult != 0,
                    child: Text(
                      "Seu reajuste salarial é: \n"
                          "R\$ ${_adjustmentYourSalaryResult.toString()}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold, ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                    onPressed: () {
                      if(_formAdjustmentKey.currentState!.validate()) {
                        _adjustmentYourSalary();
                        _salaryController.clear();
                        _adjustmentController.clear();
                      }
                    },
                    child: const Text("Verificar")),
              )
            ],
          ),
        ));
  }
}
