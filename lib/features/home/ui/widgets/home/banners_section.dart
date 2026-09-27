import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:yumquick/core/helper/helpers_functions.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/features/home/data/models/banners_model.dart';
import 'package:yumquick/features/home/logic/home/home_cubit.dart';
import 'package:yumquick/features/home/logic/home/home_state.dart';

class BannersShow extends StatelessWidget {
  // final String? imageUrl;
  // final String? title;
  // final String? offer;
  final List<BannersModel>? banners;
  const BannersShow({super.key, this.banners});

  @override
  Widget build(BuildContext context) {
    final first = (banners != null && banners!.isNotEmpty)
        ? banners!.first
        : null;
    final text = first?.title ?? 'Experience our delicious new dish 30% OFF';
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          width: double.infinity,
          height: 128.h,
          decoration: BoxDecoration(
            color: AppColors.orangeBase,
            borderRadius: BorderRadius.circular(13.r),
          ),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsetsDirectional.only(
                    start: 16.w,
                    top: 30.h,
                    end: 16.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        getTitle(text),
                        style: AppTextStyle.font16WhiteRegular.copyWith(
                          height: 1.h,
                        ),
                      ),
                      Text(getOffer(text), style: AppTextStyle.font32WhiteBold),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child:
                      (first?.imageUrl != null && first!.imageUrl!.isNotEmpty)
                      ? Image.network(
                          first.imageUrl!,
                          fit: BoxFit.cover,
                          // width: double.infinity,
                          height: double.infinity,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: SpinKitDualRing(
                                color: AppColors.yellowBase,
                                size: 30.0,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                                Icons.broken_image,
                                color: Colors.white,
                              ),
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
        PositionedDirectional(
          end: 155.w,
          top: -30.h,
          child: Container(
            width: 55.w,
            height: 55.h,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.yellowBase, width: 10.w),
            ),
          ),
        ),
        PositionedDirectional(
          start: -15.w,
          bottom: -25.h,
          child: Container(
            width: 46.w,
            height: 46.h,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.yellowBase, width: 10.w),
            ),
          ),
        ),
      ],
    );
  }
}

class BlocBuilderBanners extends StatelessWidget {
  const BlocBuilderBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      // buildWhen: (previous, current) => previous is
      builder: (context, state) {
        switch (state.bannersStatus) {
          case HomeStatus.loading:
            return Skeletonizer(enabled: true, child: const BannersShow());
          case HomeStatus.success:
            return BannersShow(banners: state.banners);
          case HomeStatus.failure:
            return Center(
              child: Text(
                state.bannersError,
                style: TextStyle(color: Colors.red),
              ),
            );
          default:
            return SizedBox.shrink();
        }
      },
    );
  }
}
