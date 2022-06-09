import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {
  final String label;
  final TextInputType? type;
  final String? initialValue;
  final bool shouldValidate;
  final Function onSaved;

  const FormInputField({
    Key? key,
    required this.label,
    required this.onSaved,
    this.type,
    this.initialValue,
    this.shouldValidate = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: type ?? TextInputType.number,
        initialValue: initialValue,
        decoration: InputDecoration(labelText: label),
        validator: shouldValidate
            ? (value) {
                if (value == null || value.isEmpty) {
                  return 'É necessário preencher este campo!';
                } else {
                  return null;
                }
              }
            : null,
        onSaved: (value) => onSaved(value),
      ),
    );
  }
}
