import 'package:flutter/material.dart';

import '../user_data.dart';

class CustomDatePickerField extends StatefulWidget {
  final String hintText;
  final Function(DateTime)? onDateSelected;
  final DateTime? initialDate;

  const CustomDatePickerField({
    super.key,
    required this.hintText,
    this.onDateSelected,
    this.initialDate,
  });

  @override
  State<CustomDatePickerField> createState() => _CustomDatePickerFieldState();
}

class _CustomDatePickerFieldState extends State<CustomDatePickerField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  DateTime? _selectedDate;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });

    if (widget.initialDate != null) {
      _selectedDate = widget.initialDate;
      _controller.text = DateFormat.yMMMMd().format(_selectedDate!);
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: now,
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _controller.text = DateFormat.yMMMMd().format(picked);
      });
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(picked);
      }
    }
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
        controller: _controller,
        readOnly: true,
        focusNode: _focusNode,
        style: AppTextStyles.h5(color: AppColors.black),
        cursorColor: AppColors.black,
        decoration: InputDecoration(
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
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: const Icon(
                Icons.event_note,
                color: AppColors.black54,
              ),
              onPressed: () => _pickDate(context),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }
}
