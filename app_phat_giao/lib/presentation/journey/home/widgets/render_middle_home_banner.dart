import 'package:app_phat_giao/commons/utils/utils.dart';
import 'package:app_phat_giao/data/model/banner.dart';
import 'package:app_phat_giao/data/remote_source/master_data_remote_source.dart';
import 'package:app_phat_giao/presentation/components/future_handler/future_handler.dart';
import 'package:app_phat_giao/presentation/components/layouts/error_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RenderMiddleHomeBanner extends StatefulWidget {
  const RenderMiddleHomeBanner({Key? key}) : super(key: key);

  @override
  State<RenderMiddleHomeBanner> createState() => _RenderMiddleHomeBannerState();
}

class _RenderMiddleHomeBannerState extends State<RenderMiddleHomeBanner> {
  final MasterDataRemoteSource _masterDataRemoteSource = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureRender<List<BannerResponse>>(
      future: _masterDataRemoteSource.getMiddleHomeBanner(),
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
