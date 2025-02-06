import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constants/app_constants/asset_paths.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// adaptive ui properties
    final screenSize = MediaQuery.of(context).size;
    final BoxConstraints defaultConstraints = BoxConstraints(
      maxHeight: screenSize.height * 0.4,
      maxWidth: screenSize.width * 0.9,
    );

    return Scaffold(
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            /// lottie file widget
            ConstrainedBox(
              constraints: defaultConstraints,
              child: Lottie.asset(
                AppAssetPaths.kNoInternetAssetPath,
                repeat: true,
                fit: BoxFit.cover,
              ),
            ),

            /// extra space for safety & center alignment
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
