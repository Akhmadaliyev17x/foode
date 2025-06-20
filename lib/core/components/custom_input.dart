import 'package:flutter/material.dart';

import '../constans/app_colors.dart';
import '../constans/app_text_styles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isSecret;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.controller,
      this.isSecret = false,
      this.onChanged});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hide = false;
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        boxShadow: _isFocused
            ? [
                const BoxShadow(
                  color: AppColors.black34,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ]
            : [],
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        onChanged: widget.onChanged,
        obscureText: hide,
        cursorColor: AppColors.black,
        cursorWidth: 1.4,
        style: AppTextStyles.h5(color: AppColors.black),
        focusNode: _focusNode,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.isSecret
              ? Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          hide = !hide;
                        });
                      },
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: AppColors.black54,
                      )))
              : null,
          hintText: widget.hintText,
          hintStyle: AppTextStyles.h5(color: AppColors.black34),
          contentPadding: const EdgeInsets.symmetric(horizontal: 25),
          filled: true,
          fillColor: AppColors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: AppColors.black34),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: AppColors.black34),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
