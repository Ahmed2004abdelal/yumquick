import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/features/home/data/repos/home_repo.dart';
import 'package:yumquick/features/home/logic/home/home_state.dart';

import '../../../../core/helper/shared_pref_helper.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeState()) {
    getBanners();
    getCategories();
    getRecommend();
  }

  int pageSize = 10;
  int currentPage = 1;
  bool hasNextPage = true;

  Future<void> getBanners() async {
    emit(state.copyWith(bannersStatus: HomeStatus.loading));
    final response = await _homeRepo.getBanners();
    response.when(
      success: (data) => emit(
        state.copyWith(bannersStatus: HomeStatus.success, banners: data),
      ),
      failure: (error) => emit(
        state.copyWith(
          bannersStatus: HomeStatus.failure,
          bannersError: error.apiErrorModel.message ?? "========error========",
        ),
      ),
    );
  }

  Future<void> getCategories() async {
    emit(state.copyWith(categoriesStatus: HomeStatus.loading));
    final response = await _homeRepo.getCategories();
    response.when(
      success: (data) => emit(
        state.copyWith(categoriesStatus: HomeStatus.success, categories: data),
      ),
      failure: (error) => emit(
        state.copyWith(
          categoriesStatus: HomeStatus.failure,
          categoriesError:
              error.apiErrorModel.message ?? "========error========",
        ),
      ),
    );
  }

  Future<void> getRecommend() async {
    emit(state.copyWith(recommendStatus: HomeStatus.loading));
    final response = await _homeRepo.getRecommended();
    response.when(
      success: (data) => emit(
        state.copyWith(recommendStatus: HomeStatus.success, recommend: data),
      ),
      failure: (error) => emit(
        state.copyWith(
          recommendStatus: HomeStatus.failure,
          recommendError:
              error.apiErrorModel.message ?? "========error========",
        ),
      ),
    );
  }

  Future<void> getProductByCategory(
    int categoryId, {
    bool isLoadMore = false,
  }) async {
    if (!hasNextPage && isLoadMore) return;
    if (isLoadMore &&
        state.productsByCategoryStatus == HomeStatus.isloadingmore) {
      return;
    }

    if (!isLoadMore) {
      currentPage = 1;
      hasNextPage = true;
      emit(state.copyWith(productsByCategoryStatus: HomeStatus.loading));
    } else {
      emit(state.copyWith(productsByCategoryStatus: HomeStatus.isloadingmore));
    }

    final response = await _homeRepo.getProductsByCategory(
      categoryId,
      pageSize,
      currentPage,
    );
    response.when(
      success: (data) {
        if (data.isEmpty) {
          hasNextPage = false;
        } else {
          currentPage++;
        }
        emit(
          state.copyWith(
            productsByCategoryStatus: HomeStatus.success,
            productsByCategory: isLoadMore
                ? [...state.productsByCategory, ...data]
                : data,
            categoryId: categoryId,
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(
          productsByCategoryStatus: HomeStatus.failure,
          productsByCategoryError:
              error.apiErrorModel.message ?? "========error========",
        ),
      ),
    );
  }

  void resetCategoryId() {
    emit(
      state.copyWith(
        categoryId: 0,
        productsByCategoryStatus: HomeStatus.initial,
        productsByCategory: [],
      ),
    );
  }

  void logOut() {
    SharedPrefHelper.clearAllSecuredData();
  }
}
