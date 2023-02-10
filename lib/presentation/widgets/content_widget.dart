import 'package:flutter/material.dart';

import '../../core/managers/color_manager.dart';
import '../../core/managers/font_manager.dart';
import '../../core/managers/styles_manager.dart';
import '../../domain/entities/info_entity.dart';
import 'custom_check_box.dart';
import 'custom_drop_down.dart';
import 'custom_radio_button.dart';

class ContentWidget extends StatelessWidget {
  final List<InfoEntity> info;
  const ContentWidget({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            _buildCard(),
            _buildCard(),
            _buildCard(),
            _buildCard(),
          ],
        ));
  }

  Card _buildCard() {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCategoryName('Properties'),
            _buildSubCategoryName('1) All Properties'),
            _buildSubCategoryName('2) Residential Properties'),
            _buildDetails(1),
            _buildDetails(2),
            _buildDetails(3),
            _buildSubCategoryName('3) Commercial Properties'),
            _buildDetails(4),
            _buildDetails(5),
            _buildDetails(6),
            _buildSubCategoryName('4) Land'),
            _buildDetails(7),
            _buildDetails(8),
          ],
        ),
      ),
    );
  }



  Widget _buildCategoryName(String label) {
    return Text(
      label,
      style: getBoldStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s18,
      ),
    );
  }


  Widget _buildSubCategoryName(String name) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        name,
        style: getSemiBoldStyle(
          color: Colors.black,
          fontSize: FontSize.s16,
        ),
      ),
    );
  }

  Widget _buildDetails(int type) {
    switch (type) {
      case 4:
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomDropDown(
            items: ['Item1', 'Item2', 'Item3'],
            label: 'Drop Down Label',
          ),
        );
      case 6:
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomRadioButton(
            items: ['Item1', 'Item2', 'Item3'],
            label: 'Radio Buttons Label',
          ),
        );
      case 7:
        return const CustomCheckBox(item: 'item');
      default:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
           getLabelFromType(type),
            style: getMediumStyle(
              color: Colors.black,
              fontSize: FontSize.s14,
            ),
          ),
        );
    }
  }

  String getLabelFromType(int type){
    switch(type){
      case 1:
      return 'Text';
      case 2:
      return 'Integer';
      case 3:
      return 'Decimal';
      case 5:
      return 'List';
      case 8:
      return 'Label';
      default:
      return '';
    }
  }
}
