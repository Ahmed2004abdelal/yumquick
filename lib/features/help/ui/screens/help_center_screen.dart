import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/custom_app_bar.dart';
import 'package:yumquick/features/help/data/models/contact_us_model.dart';
import 'package:yumquick/features/help/data/models/faq_model.dart';
import 'package:yumquick/features/help/logic/help_cubit.dart';
import 'package:yumquick/features/help/logic/help_state.dart';

const _darkText = Color(0xFF391713);

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  static const List<String> tabs = ['FAQ', 'Contact Us'];

  @override
  void initState() {
    super.initState();
    final cubit = context.read<HelpCubit>();
    cubit.getFaq();
    cubit.getContactUs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100.h,
        backgroundColor: AppColors.yellowBase,
        flexibleSpace: CustomAppBar(title: 'Help Center'),
      ),
      body: Container(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 35.w,
          vertical: 30.h,
        ),
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
            BlocSelector<HelpCubit, HelpState, int>(
              selector: (state) => state.selectedTabIndex,
              builder: (context, selectedTabIndex) {
                return HelpCenterTabbar(
                  tabs: tabs,
                  selectedTabIndex: selectedTabIndex,
                );
              },
            ),
            SizedBox(height: 20.h),
            const Expanded(child: HelpCenterBody()),
          ],
        ),
      ),
    );
  }
}

class HelpCenterTabbar extends StatelessWidget {
  const HelpCenterTabbar({
    super.key,
    required this.tabs,
    required this.selectedTabIndex,
  });

  final List<String> tabs;
  final int selectedTabIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(tabs.length, (index) {
        final selected = index == selectedTabIndex;
        return GestureDetector(
          onTap: () => context.read<HelpCubit>().changeSelectedTabIndex(index),
          child: Container(
            alignment: Alignment.center,
            height: 28.h,
            width: 155.w,
            decoration: BoxDecoration(
              color: selected ? AppColors.orangeBase : AppColors.orangeTwo,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Text(
              tabs[index],
              style: AppTextStyle.font17WhiteMedium.copyWith(
                color: selected ? Colors.white : AppColors.orangeBase,
              ),
            ),
          ),
        );
      }),
    );
  }
}

/// بيتبني بس لما التاب يتغير
class HelpCenterBody extends StatelessWidget {
  const HelpCenterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpCubit, HelpState>(
      buildWhen: (p, c) => p.selectedTabIndex != c.selectedTabIndex,
      builder: (context, state) {
        switch (state.selectedTabIndex) {
          case 0:
            return const FaqView();
          case 1:
            return const ContactUsView();
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}

// ───────────────────────── FAQ ─────────────────────────

class FaqView extends StatefulWidget {
  const FaqView({super.key});

  @override
  State<FaqView> createState() => _FaqViewState();
}

class _FaqViewState extends State<FaqView> {
  final _searchController = TextEditingController();
  String _query = '';
  int? _expandedId;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SearchField(
          controller: _searchController,
          onChanged: (v) => setState(() => _query = v.trim().toLowerCase()),
        ),
        SizedBox(height: 12.h),
        Expanded(
          child: BlocBuilder<HelpCubit, HelpState>(
            buildWhen: (p, c) =>
                p.faqStatus != c.faqStatus ||
                p.faqSuccessList != c.faqSuccessList,
            builder: (context, state) {
              switch (state.faqStatus) {
                case HelpStatus.initial:
                case HelpStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.orangeBase,
                    ),
                  );
                case HelpStatus.failure:
                  return _ErrorView(
                    message: state.errorMessage,
                    onRetry: () => context.read<HelpCubit>().getFaq(),
                  );
                case HelpStatus.success:
                  final items = state.faqSuccessList.where((f) {
                    if (_query.isEmpty) return true;
                    return f.question.toLowerCase().contains(_query) ||
                        f.answer.toLowerCase().contains(_query);
                  }).toList();

                  if (items.isEmpty) {
                    return const Center(child: Text('No results found'));
                  }

                  return ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (_, __) =>
                        Divider(height: 1, color: AppColors.orangeTwo),
                    itemBuilder: (context, index) {
                      final faq = items[index];
                      return FaqItem(
                        faq: faq,
                        isExpanded: _expandedId == faq.id,
                        onTap: () => setState(() {
                          _expandedId = _expandedId == faq.id ? null : faq.id;
                        }),
                      );
                    },
                  );
              }
            },
          ),
        ),
      ],
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.controller, required this.onChanged});

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                isDense: true,
                hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
            ),
          ),
          Container(
            width: 26.w,
            height: 26.w,
            decoration: const BoxDecoration(
              color: AppColors.orangeBase,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.tune, color: Colors.white, size: 15.sp),
          ),
        ],
      ),
    );
  }
}

class FaqItem extends StatelessWidget {
  const FaqItem({
    super.key,
    required this.faq,
    required this.isExpanded,
    required this.onTap,
  });

  final FaqModel faq;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    faq.question,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: isExpanded ? _darkText : AppColors.orangeBase,
                    ),
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: AppColors.orangeBase,
                ),
              ],
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              child: isExpanded
                  ? Padding(
                      padding: EdgeInsets.only(top: 12.h),
                      child: Text(
                        faq.answer,
                        style: TextStyle(fontSize: 11.sp, color: _darkText),
                      ),
                    )
                  : const SizedBox(width: double.infinity),
            ),
          ],
        ),
      ),
    );
  }
}

// ──────────────────────── Contact Us ────────────────────────

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  int? _expandedId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpCubit, HelpState>(
      buildWhen: (p, c) =>
          p.contactUsStatus != c.contactUsStatus ||
          p.contactUsSuccessList != c.contactUsSuccessList,
      builder: (context, state) {
        switch (state.contactUsStatus) {
          case HelpStatus.initial:
          case HelpStatus.loading:
            return const Center(
              child: CircularProgressIndicator(color: AppColors.orangeBase),
            );
          case HelpStatus.failure:
            return _ErrorView(
              message: state.errorMessage,
              onRetry: () => context.read<HelpCubit>().getContactUs(),
            );
          case HelpStatus.success:
            final items = state.contactUsSuccessList;
            if (items.isEmpty) {
              return const Center(child: Text('No contact info available'));
            }
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ContactUsItem(
                  item: item,
                  isExpanded: _expandedId == item.id,
                  onTap: () => setState(() {
                    _expandedId = _expandedId == item.id ? null : item.id;
                  }),
                );
              },
            );
        }
      },
    );
  }
}

class ContactUsItem extends StatelessWidget {
  const ContactUsItem({
    super.key,
    required this.item,
    required this.isExpanded,
    required this.onTap,
  });

  final ContactUsModel item;
  final bool isExpanded;
  final VoidCallback onTap;

  IconData get _icon {
    final p = item.platform.toLowerCase();
    if (p.contains('whats')) return Icons.chat_outlined;
    if (p.contains('face')) return Icons.facebook_outlined;
    if (p.contains('insta')) return Icons.camera_alt_outlined;
    if (p.contains('web')) return Icons.language;
    return Icons.headset_mic_outlined; // customer service
  }

  // Future<void> _launch(BuildContext context) async {
  //   final p = item.platform.toLowerCase();
  //   final value = item.urlOrNumber.trim();
  //   final Uri uri;

  //   if (p.contains('whats')) {
  //     uri = Uri.parse(
  //       'https://wa.me/${value.replaceAll(RegExp(r'[^0-9]'), '')}',
  //     );
  //   } else if (p.contains('customer') || p.contains('phone')) {
  //     uri = Uri(scheme: 'tel', path: value);
  //   } else {
  //     uri = Uri.parse(value.startsWith('http') ? value : 'https://$value');
  //   }

  //   final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
  //   if (!ok && context.mounted) {
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(const SnackBar(content: Text('Could not open this link')));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Icon(_icon, color: AppColors.orangeBase, size: 30.sp),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    item.platform,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: _darkText,
                    ),
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: AppColors.orangeBase,
                ),
              ],
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: isExpanded
                ? GestureDetector(
                    onTap: () => {
                      // _launch(context)
                    },
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 42.w,
                        top: 8.h,
                      ),
                      child: Text(
                        item.urlOrNumber,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.orangeBase,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────── Shared ─────────────────────────

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message.isEmpty ? 'Something went wrong' : message,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
          TextButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
