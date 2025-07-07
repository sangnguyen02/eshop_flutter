import 'package:eshop/common/widgets/error_handler/retry_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/formatters/formatter.dart';

class ErrorHandler extends StatelessWidget {
  const ErrorHandler({
    super.key,
    this.height,
    required this.errorMessage,
    this.showRetry = true,
    this.onRetryPressed,
  });

  final double? height;
  final String errorMessage;
  final bool showRetry;
  final void Function()? onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        children: [
          Text(EshopFormatter.formatError(errorMessage), style: Theme.of(context).textTheme.labelMedium),
          if (showRetry)
            RetryButton(
              title: 'Retry',
              onPressed: onRetryPressed,
            ),
        ],
      ),
    );
  }
}