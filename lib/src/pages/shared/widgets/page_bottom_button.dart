import 'package:flutter/material.dart';

import '../../../components/custom_loading.dart';
import '../../../infrastructures/utils/constants.dart';
import '../../../infrastructures/utils/spacing.dart';

class PageBottomButton extends StatelessWidget {
  const PageBottomButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.isActive,
    this.transparentBackground = true,
    this.isLoading = false,
  });

  final bool isActive;
  final VoidCallback onTap;
  final String label;
  final bool isLoading;
  final bool transparentBackground;

  @override
  build(BuildContext context) => Container(
    width: double.infinity,
    color: transparentBackground ? Colors.transparent : Colors.white,
    padding: EdgeInsetsGeometry.symmetric(
      horizontal: Constants.horizontalPagePaddingSize,
      vertical: Constants.verticalPagePaddingSize,
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive
            ? Theme.of(context).primaryColor
            : Theme.of(context).colorScheme.onSecondary,
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.shapeRadius),
        ),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isActive
                  ? Theme.of(context).colorScheme.surface
                  : null,
            ),
          ),
          if (isLoading) ...[
            AppSpacing.smallHorizontalSpacer,
            SizedBox(
              width: 20,
              height: 20,
              child: isLoading
                  ? const CustomLoading()
                  : const SizedBox.shrink(),
            ),
          ],
        ],
      ),
    ),
  );
}
