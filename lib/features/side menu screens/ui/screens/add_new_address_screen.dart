import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/helper/helpers_functions.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/custom_app_bar.dart';
import 'package:yumquick/core/widgets/custom_button.dart';
import 'package:yumquick/core/widgets/custom_textform.dart';
import 'package:yumquick/features/side%20menu%20screens/logic/address%20logic/address_cubit.dart';
import 'package:yumquick/features/side%20menu%20screens/logic/address%20logic/address_state.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    addNewAddress(BuildContext context) {
      if (context.read<AddressCubit>().formKey.currentState!.validate()) {
        context.read<AddressCubit>().addAddress();
      }
    }

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
        child: SingleChildScrollView(
          child: Form(
            key: context.read<AddressCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/icons/home-icon.svg',
                    width: 76.w,
                    height: 66.49.h,
                  ),
                ),
                verticalSpace(53.51.h),
                Text('Name', style: AppTextStyle.font20BlackMedium),
                verticalSpace(12.h),
                CustomTextForm(
                  controller: context.read<AddressCubit>().nameController,
                  hint: 'Add your address title',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address title';
                    }
                    return null;
                  },
                  isObsecure: false,
                ),
                verticalSpace(32),

                Text('Address', style: AppTextStyle.font20BlackMedium),
                verticalSpace(12),
                CustomTextForm(
                  maxLines: 2,
                  controller: context.read<AddressCubit>().addressController,
                  hint: 'Add your address',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address title';
                    }
                    return null;
                  },
                  isObsecure: false,
                ),
                verticalSpace(100),
                Center(
                  child: CustomButton(
                    onPressed: () => addNewAddress(context),
                    text: "Apply",
                  ),
                ),
                AddAddressListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddAddressListener extends StatelessWidget {
  const AddAddressListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressCubit, AddressState>(
      listenWhen: (previous, current) =>
          previous.addAddressStatus != current.addAddressStatus,
      listener: (context, state) {
        if (state.addAddressStatus == AddressStatus.loading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => Center(
              child: CircularProgressIndicator(
                color: AppColors.orangeBase,
                strokeWidth: 2.w,
              ),
            ),
          );
          return;
        }

        if (state.addAddressStatus == AddressStatus.initial) return;

        Navigator.pop(context);

        if (state.addAddressStatus == AddressStatus.success) {
          showSnack(context, state.addAddressSuccessMessage, Colors.green);
          Navigator.pop(context);
        } else if (state.addAddressStatus == AddressStatus.failure) {
          showSnack(context, state.addAddressError, Colors.red);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
