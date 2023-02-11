// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:klshimol_task/core/managers/font_manager.dart';
import 'package:klshimol_task/core/managers/styles_manager.dart';

class CustomRadioButton extends StatefulWidget {
  final String label;
  final List<String> items;
  const CustomRadioButton({
    Key? key,
    required this.label,
    required this.items,
  }) : super(key: key);

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  String? groupValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '-${widget.label}',
          style: getMediumStyle(
            color: Colors.black,
            fontSize: FontSize.s14,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Wrap(
            children: widget.items
                .map(
                  (e) => Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      Radio(
                        value: e,
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value.toString();
                          });
                        },
                      ),
                      Text(e),
                    ],
                  ),
                )
                .toList()),
      ],
    );
  }
}
