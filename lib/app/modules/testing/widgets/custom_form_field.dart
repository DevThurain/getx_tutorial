import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomFormField extends FormField<String?> {
  CustomFormField({
    super.key,
    ValueChanged<String?>? onChanged,
    super.validator,
    super.autovalidateMode,
  }) : super(
          builder: (state) {
            void onChangedHandler(String? value) {
              state.didChange(value);
              if (onChanged != null) {
                onChanged(value);
              }
            }

            return Column(
              children: [
                TextFormField(
                  onChanged: (text) {
                    onChangedHandler(text);
                  },
                ),
                state.hasError ? _buildErrorWidget(state) : SizedBox(),
              ],
            );
          },
        );

  static Column _buildErrorWidget(FormFieldState<String?> state) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.red),
            const SizedBox(width: 16),
            Text(state.errorText ?? "", style: const TextStyle(color: Colors.red)),
          ],
        ),
      ],
    );
  }
}
