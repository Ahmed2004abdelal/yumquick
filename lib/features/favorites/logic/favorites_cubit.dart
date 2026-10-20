import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/features/favorites/data/repos/favorites_repo.dart';
import 'package:yumquick/features/favorites/logic/favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepo _favoritesRepo;
  FavoritesCubit(this._favoritesRepo) : super(FavoritesState()) {
    getFavorites();
  }

  final ScrollController sliverController = ScrollController();
  final ScrollController gridViewController = ScrollController();

  @override
  Future<void> close() {
    sliverController.dispose();
    gridViewController.dispose();
    return super.close();
  }

  Future<void> getFavorites() async {
    emit(state.copyWith(favoriteStatus: FavoritesStatus.loading));
    final response = await _favoritesRepo.getFavorites();
    response.when(
      success: (data) => emit(
        state.copyWith(
          favoriteProducts: data,
          favoriteStatus: FavoritesStatus.success,
        ),
      ),
      failure: (error) => emit(
        state.copyWith(
          favoriteErrorMessage:
              error.apiErrorModel.message ?? '========error========',
          favoriteStatus: FavoritesStatus.failure,
        ),
      ),
    );
  }
}
