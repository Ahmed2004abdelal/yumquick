import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/Routing/routes.dart';
import 'package:yumquick/core/helper/extensions.dart';
import 'package:yumquick/features/help/logic/help_cubit.dart';

class HelpCategoriesModel {
  final String title;
  final String description;
  final void Function(BuildContext context)? onTap;

  HelpCategoriesModel({
    required this.title,
    required this.description,
    required this.onTap,
  });
}

List<HelpCategoriesModel> get helpCategories => [
  HelpCategoriesModel(
    title: 'Help with the order',
    description: 'Support',
    onTap: (context) => context.pushNamed(
      Routes.supportScreen,
      arguments: context.read<HelpCubit>()..getsupportIssues(),
    ),
  ),
  HelpCategoriesModel(
    title: 'Help center',
    description: 'General Information',
    onTap: (context) => context.pushNamed(
      Routes.helpCenterScreen,
      arguments: context.read<HelpCubit>(),
    ),
  ),
];
