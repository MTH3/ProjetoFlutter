import 'package:flutter/material.dart';

class AppForm extends StatelessWidget {
  String label;
  String hint;
  bool password;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode nextFocus;

  AppForm(
    this.label,
    this.hint, {
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.nextFocus,
    this.password = false,
    this.textInputAction,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      textInputAction: textInputAction,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        hintStyle: TextStyle(color: Colors.black26, fontSize: 18),
        labelStyle: TextStyle(color: Colors.blueGrey, fontSize: 20),
        labelText: label,
        hintText: hint,
      ),
    );
  }
}
