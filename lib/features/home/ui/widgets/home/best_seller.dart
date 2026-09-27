import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/widgets/product_price.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 11.32.w,
      children: List.generate(4, (index) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 108.h,
              width: 72.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/first-boarding.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(19.12.r),
              ),
            ),
            PositionedDirectional(
              bottom: 12.h,
              end: -2.w,

              child: ProductPrice(price: 130),
            ),
          ],
        );
      }),
    );
  }
}
