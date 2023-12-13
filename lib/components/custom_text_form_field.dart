import "package:flutter/material.dart";
import "package:flutter/services.dart";

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration? decoration;

  const CustomTextFormField({
    super.key,
    this.validator,
    this.onChange,
    this.maxLength,
    this.decoration,
    this.inputFormatters,
    this.keyboardType,
    required this.controller,

  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return
        SizedBox(
          width: width,
          child: TextFormField(
            inputFormatters: inputFormatters,
            controller: controller,
            keyboardType: keyboardType,
            maxLength: maxLength,
            decoration: decoration,
            validator: validator,
          ),
        );
  }
}

// Responsive sized;