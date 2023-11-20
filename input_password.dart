import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  const InputPassword(
      {this.controller,
        this.hintText,
        this.labelText,
        this.inputType,
        this.icon,
        this.isPasswordField});

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? inputType;
  final bool? isPasswordField;
  final IconData? icon;

  @override
  State<InputPassword> createState() => _InputPassword();
}

class _InputPassword extends State<InputPassword> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.35),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        controller: widget.controller,
        keyboardType: widget.inputType,
        obscureText: widget.isPasswordField == true ? _obscureText : false,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.black45),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: widget.isPasswordField == true
                ? Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: _obscureText == false ? Colors.blue : Colors.grey,
            )
                : const Text(""),
          ),
        ),
      ),
    );
  }
}
