import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../theme/custom_text_style.dart';

class NoCompanion extends StatelessWidget {
  const NoCompanion({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "You don't have a companion yet",
        style: CustomTextStyles.headlineSmallGray700,
      ),
    );
  }
}
