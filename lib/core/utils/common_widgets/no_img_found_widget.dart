import 'package:flutter/cupertino.dart';

import '../../constants/app_constants/asset_paths.dart';

class NoImgFoundWidget extends StatelessWidget {
  const NoImgFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppAssetPaths.kNoImgFoundAssetPath,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
