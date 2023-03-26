import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final String obsuringCharacter;
  final IconData icons;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.obscureText,
    required this.obsuringCharacter,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller,
        obscureText: obscureText,

        //  scrollPadding: EdgeInsets.only(bottom: 220),
        //style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          labelText: labelText,
          prefixIcon: Icon(icons, color: Colors.indigo),

          //    labelStyle: TextStyle(color: Colors.white),
          hintStyle: const TextStyle(color: Colors.indigo),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo),
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
      ),
    );
  }
}
