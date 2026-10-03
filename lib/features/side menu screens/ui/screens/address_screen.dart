import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/Routing/routes.dart';
import 'package:yumquick/core/helper/extensions.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/custom_app_bar.dart';
import 'package:yumquick/core/widgets/custom_button.dart';
import 'package:yumquick/core/widgets/selection_dot.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/address%20models/get_address_response.dart';
import 'package:yumquick/features/side%20menu%20screens/logic/address%20logic/address_cubit.dart';
import 'package:yumquick/features/side%20menu%20screens/logic/address%20logic/address_state.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      appBar: AppBar(
        backgroundColor: AppColors.yellowBase,
        leadingWidth: 0.w,
        toolbarHeight: 100.h,
        leading: const SizedBox.shrink(),
        flexibleSpace: CustomAppBar(title: 'Delivery Address'),
      ),
      body: Container(
        padding: EdgeInsetsDirectional.all(35.w),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          children: [
            GetAddressBlocBuilder(),
            verticalSpace(20),
            CustomButton(
              onPressed: () {
                context.pushNamed(
                  Routes.addNewAddressScreen,
                  arguments: context.read<AddressCubit>(),
                );
              },
              text: 'Add New Address',
            ),
          ],
        ),
      ),
    );
  }
}

class GetAddressBlocBuilder extends StatelessWidget {
  const GetAddressBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      buildWhen: (previous, current) =>
          previous.getAddressStatus != current.getAddressStatus ||
          previous.addresses != current.addresses ||
          previous.getAddressError != current.getAddressError ||
          previous.defaultAddressId != current.defaultAddressId,
      builder: (context, state) {
        switch (state.getAddressStatus) {
          case AddressStatus.initial:
            return Center(
              child: SpinKitFadingCube(color: AppColors.orangeBase, size: 20.w),
            );
          case AddressStatus.loading:
            return Center(
              child: SpinKitFadingCube(color: AppColors.orangeBase, size: 20.w),
            );
          case AddressStatus.failure:
            return Center(
              child: Text(
                state.getAddressError,
                style: AppTextStyle.font18BlackSemiBold,
              ),
            );
          case AddressStatus.success:
            return AddressListShow(addresses: state.addresses);
        }
      },
    );
  }
}

class AddressListShow extends StatelessWidget {
  final List<GetAddressResponse> addresses;
  const AddressListShow({super.key, required this.addresses});

  void setDefaultAddress(BuildContext context, int addressId) {
    context.read<AddressCubit>().setDefaultAddress(addressId);
  }

  @override
  Widget build(BuildContext context) {
    if (addresses.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/icons/home-icon.svg',
                width: 48.w,
                height: 42.h,
              ),
              SizedBox(height: 16.h),
              Text('No addresses yet', style: AppTextStyle.font20BlackMedium),
              SizedBox(height: 6.h),
              Text(
                'Add an address to get started',
                style: AppTextStyle.font14BlackLight,
              ),
            ],
          ),
        ),
      );
    }

    final defaultAddressId = context.select(
      (AddressCubit c) => c.state.defaultAddressId,
    );

    return Column(
      children: List.generate(addresses.length, (index) {
        final address = addresses[index];
        return Column(
          children: [
            if (index == 0)
              Divider(color: AppColors.orangeTwo, thickness: 1.h, height: 25.h),
            GestureDetector(
              onTap: () => setDefaultAddress(context, address.id),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/home-icon.svg',
                    width: 31.w,
                    height: 27.12.h,
                  ),
                  horizontalSpace(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(address.name, style: AppTextStyle.font20BlackMedium),
                      Text(
                        address.address,
                        style: AppTextStyle.font14BlackLight,
                      ),
                    ],
                  ),
                  const Spacer(),
                  SelectionDot(isSelected: address.id == defaultAddressId),
                ],
              ),
            ),
            Divider(color: AppColors.orangeTwo, thickness: 1.h, height: 27.h),
          ],
        );
      }),
    );
  }
}
