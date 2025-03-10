import 'package:employee_info/feat/edit_emp_details/view_model/edit_emp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import '../../../../../core/utils/common_widgets/text_widget.dart';

void showDesignationBottomSheet({
  required BuildContext context,
  required List<String> designations,
}) {
  final editEmpCubit = context.read<EditEmpCubit>();
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.whiteColor,
    builder: (context) {
      return Container(
        padding: EdgeInsets.all(8),
        height: 300.0,
        alignment: Alignment.center,
        child: ListView.separated(
          itemCount: designations.length,
          separatorBuilder: (context, index) {
            return const SizedBox.shrink();
          },
          itemBuilder: (context, index) {
            var item = designations[index];
            return GestureDetector(
              onTap: () {
                editEmpCubit.selectedDesignationVal = item;
                editEmpCubit.onDropDownValSelected(roleSelected: item);
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextWidget(
                  txtVal: item,
                  textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
