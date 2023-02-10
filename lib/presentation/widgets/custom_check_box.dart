// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final String item;
  const CustomCheckBox({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? checkedValue=false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
  title: Text(widget.item),
  value: checkedValue,
  onChanged: (newValue) {
    setState(() {
      checkedValue = newValue;
    });
  },
  controlAffinity: ListTileControlAffinity.leading, 
);
  }
}
