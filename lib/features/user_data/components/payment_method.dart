import 'package:flutter/material.dart';

class PaymentMethodSelector extends StatefulWidget {
  final List<String> imagePaths;
  final Function(int selectedIndex)? onChanged;

  const PaymentMethodSelector({
    super.key,
    required this.imagePaths,
    this.onChanged,
  });

  @override
  State<PaymentMethodSelector> createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<PaymentMethodSelector> {
  int _selectedIndex = 0;
  final animated = Matrix4.identity()..scale(1.03);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.imagePaths.length, (index) {
        final isSelected = index == _selectedIndex;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(index);
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: 300,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected ? Colors.red : Colors.grey.shade300,
                width: 2,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Colors.red.withAlpha(30),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ]
                  : [],
            ),
            transform: isSelected ? animated : Matrix4.identity(),
            child: Center(
              child: Image.asset(
                widget.imagePaths[index],
                height: 40,
              ),
            ),
          ),
        );
      }),
    );
  }
}
