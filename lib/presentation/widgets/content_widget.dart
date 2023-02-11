import 'package:flutter/material.dart';
import 'package:klshimol_task/domain/entities/details_entity.dart';

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
      child: ListView.builder(
        itemCount: info.length,
        itemBuilder: (context, index) => _buildCard(info[index]),
      ),
    );
  }

  Card _buildCard(InfoEntity infoEntity) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCategoryName(infoEntity.name),
            for (int i = 0; i < infoEntity.subcategories.length; i++)
              _buildSubcategory(infoEntity, i)
          ],
        ),
      ),
    );
  }

  Column _buildSubcategory(InfoEntity infoEntity, int i) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSubCategoryName(infoEntity.subcategories[i].name, i),
        ...infoEntity.subcategories[i].details
            .map(
              (e) => _buildDetails(e),
            )
            .toList()
      ],
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

  Widget _buildSubCategoryName(String name, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        '${index + 1}) $name',
        style: getSemiBoldStyle(
          color: Colors.black,
          fontSize: FontSize.s16,
        ),
      ),
    );
  }

  Widget _buildDetails(DetailsEntity detailsEntity) {
    switch (detailsEntity.fieldType) {
      case 4:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomDropDown(
            items: detailsEntity.contentList!,
            label: detailsEntity.fieldName,
          ),
        );
      case 6:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomRadioButton(
            items: detailsEntity.contentList!,
            label: detailsEntity.fieldName,
          ),
        );
      case 7:
        return CustomCheckBox(item: detailsEntity.fieldName);
      default:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '-${detailsEntity.fieldName}',
            style: getMediumStyle(
              color: Colors.black,
              fontSize: FontSize.s14,
            ),
          ),
        );
    }
  }
}
