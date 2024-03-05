import 'package:app_phat_giao/commons/utils/utils.dart';
import 'package:app_phat_giao/data/model/banner.dart';
import 'package:app_phat_giao/data/remote_source/master_data_remote_source.dart';
import 'package:app_phat_giao/presentation/components/future_handler/future_handler.dart';
import 'package:app_phat_giao/presentation/components/layouts/error_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RenderTopHomeBanner extends StatefulWidget {
  const RenderTopHomeBanner({Key? key}) : super(key: key);

  @override
  State<RenderTopHomeBanner> createState() => _RenderTopHomeBannerState();
}

class _RenderTopHomeBannerState extends State<RenderTopHomeBanner> {
  final MasterDataRemoteSource _masterDataRemoteSource = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureRender<List<BannerResponse>>(
      future: _masterDataRemoteSource.getTopHomeBanner(),
      resultWidget: (banners) {
        if (banners.isEmpty) return const SizedBox.shrink();
        return InkWell(
          onTap: () => Utils.openURL(banners[0].url),
          child: Image.network(
            banners[0].image!,
            height: 120.h,
            width: double.maxFinite,
            fit: BoxFit.fill,
          ),
        );
      },
      errorWidget: (error) {
        return ErrorLayout(
          onTryAgain: () {
            setState(() {});
          },
        );
      },
    );
  }
}
