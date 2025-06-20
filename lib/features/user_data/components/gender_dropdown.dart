import 'package:flutter/material.dart';

import '../user_data.dart';

class CustomDropdown extends StatefulWidget {
  final String hintText;
  final Function(String)? onChanged;
  final String? selectedValue;

  const CustomDropdown({
    super.key,
    required this.hintText,
    this.onChanged,
    this.selectedValue,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  String? _value;

  final List<String> _items = ['Male', 'Female'];

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });

    // Default value 'Male' agar selectedValue berilmagan bo‘lsa
    _value = widget.selectedValue ?? 'Male';
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
      child: DropdownButtonFormField<String>(
        focusNode: _focusNode,
        value: _value,
        items: _items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      item,
                      style: AppTextStyles.h5(color: AppColors.black),
                    ),
                  ),
                ))
            .toList(),
        onChanged: (val) {
          setState(() {
            _value = val;
          });
          if (widget.onChanged != null && val != null) {
            widget.onChanged!(val);
          }
        },
        decoration: InputDecoration(
          // contentPadding: const EdgeInsets.symmetric(horizontal: 25),
          filled: true,
          fillColor: AppColors.white,
          hintText: widget.hintText,
          hintStyle: AppTextStyles.h5(color: AppColors.black34),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: AppColors.black34),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: AppColors.black34),
          ),
        ),
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.black54,
        ),
        dropdownColor: AppColors.white,
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
