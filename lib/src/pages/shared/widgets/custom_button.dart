import 'package:flutter/material.dart';

import '../../../infrastructures/utils/spacing.dart';
import '../../../components/custom_loading.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.action,
    required this.forAccept,
    this.isDisable = false,
  });

  final void Function() action;
  final bool forAccept;
  final bool? isDisable;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: AppSpacing.smallPadding,
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: forAccept
                ? theme.colorScheme.onSurface
                : theme.colorScheme.error,
            textStyle: theme.textTheme.bodyMedium,
            elevation: AppSpacing.giantSpace,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.giantSpace),
            ),
          ),
          onPressed: action,
          child: isDisable!
              ? const CustomLoading()
              : Text(forAccept ? 'تایید اطلاعات' : 'رد اطلاعات'),
        ),
      ),
    );
  }
}
