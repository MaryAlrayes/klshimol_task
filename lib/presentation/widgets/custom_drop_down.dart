// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klshimol_task/core/managers/font_manager.dart';

import '../../../../../core/managers/color_manager.dart';
import '../../../../../core/managers/styles_manager.dart';
import '../../../../../core/managers/values_manager.dart';

class CustomDropDown extends StatefulWidget {
  final String label;
  final List<String> items;
  const CustomDropDown({
    Key? key,
    required this.label,
    required this.items,
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selected;

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
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: ColorManager.grey),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                AppSize.s8,
              ),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              child: DropdownButton<String>(
                value: selected,
                hint: const Text('Choose'),
                items: widget.items
                    .map((e) => _buildDropMenuItem(context, e))
                    .toList(),
                onChanged: ((value) {
                  setState(() {
                    selected = value;
                  });
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }

  DropdownMenuItem<String> _buildDropMenuItem(BuildContext context, String e) {
    return DropdownMenuItem(
      value: e,
      child: Text(
        e,
        style: getRegularStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
