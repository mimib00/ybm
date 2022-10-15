import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  final bool? obscure;
  final Color? fillColor;
  final Widget? prefix;
  final Widget? suffix;
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.text,
    this.obscure,
    this.fillColor = const Color(0xffF0F0F0),
    this.prefix,
    this.suffix,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obscure;

  @override
  void initState() {
    obscure = widget.obscure ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscure,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: widget.text,
        fillColor: widget.fillColor,
        filled: true,
        prefixIcon: widget.prefix,
        suffixIcon: widget.obscure != null
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                child: Icon(!obscure ? Icons.visibility_off : Icons.visibility),
              )
            : widget.suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1.5,
            color: Color(0xffF0F0F0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1.5,
            color: Colors.white60,
          ),
        ),
      ),
    );
  }
}
