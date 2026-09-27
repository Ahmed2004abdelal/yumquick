// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 HomeStatus get bannersStatus; HomeStatus get categoriesStatus; HomeStatus get recommendStatus; HomeStatus get productsByCategoryStatus; List<BannersModel> get banners; List<CategoriesModel> get categories; List<ProductsModel> get recommend; List<ProductsModel> get productsByCategory; String get bannersError; String get recommendError; String get categoriesError; String get productsByCategoryError; int get categoryId;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HomeState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.bannersStatus, _this.bannersStatus) || other.bannersStatus == _this.bannersStatus)&&(identical(other.categoriesStatus, _this.categoriesStatus) || other.categoriesStatus == _this.categoriesStatus)&&(identical(other.recommendStatus, _this.recommendStatus) || other.recommendStatus == _this.recommendStatus)&&(identical(other.productsByCategoryStatus, _this.productsByCategoryStatus) || other.productsByCategoryStatus == _this.productsByCategoryStatus)&&const DeepCollectionEquality().equals(other.banners, _this.banners)&&const DeepCollectionEquality().equals(other.categories, _this.categories)&&const DeepCollectionEquality().equals(other.recommend, _this.recommend)&&const DeepCollectionEquality().equals(other.productsByCategory, _this.productsByCategory)&&(identical(other.bannersError, _this.bannersError) || other.bannersError == _this.bannersError)&&(identical(other.recommendError, _this.recommendError) || other.recommendError == _this.recommendError)&&(identical(other.categoriesError, _this.categoriesError) || other.categoriesError == _this.categoriesError)&&(identical(other.productsByCategoryError, _this.productsByCategoryError) || other.productsByCategoryError == _this.productsByCategoryError)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId));
}


@override
int get hashCode {
  final _this = this as HomeState;
  return Object.hash(runtimeType,_this.bannersStatus,_this.categoriesStatus,_this.recommendStatus,_this.productsByCategoryStatus,const DeepCollectionEquality().hash(_this.banners),const DeepCollectionEquality().hash(_this.categories),const DeepCollectionEquality().hash(_this.recommend),const DeepCollectionEquality().hash(_this.productsByCategory),_this.bannersError,_this.recommendError,_this.categoriesError,_this.productsByCategoryError,_this.categoryId);
}

@override
String toString() {
  final _this = this as HomeState;
  return 'HomeState(bannersStatus: ${_this.bannersStatus}, categoriesStatus: ${_this.categoriesStatus}, recommendStatus: ${_this.recommendStatus}, productsByCategoryStatus: ${_this.productsByCategoryStatus}, banners: ${_this.banners}, categories: ${_this.categories}, recommend: ${_this.recommend}, productsByCategory: ${_this.productsByCategory}, bannersError: ${_this.bannersError}, recommendError: ${_this.recommendError}, categoriesError: ${_this.categoriesError}, productsByCategoryError: ${_this.productsByCategoryError}, categoryId: ${_this.categoryId})';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 HomeStatus bannersStatus, HomeStatus categoriesStatus, HomeStatus recommendStatus, HomeStatus productsByCategoryStatus, List<BannersModel> banners, List<CategoriesModel> categories, List<ProductsModel> recommend, List<ProductsModel> productsByCategory, String bannersError, String recommendError, String categoriesError, String productsByCategoryError, int categoryId
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bannersStatus = null,Object? categoriesStatus = null,Object? recommendStatus = null,Object? productsByCategoryStatus = null,Object? banners = null,Object? categories = null,Object? recommend = null,Object? productsByCategory = null,Object? bannersError = null,Object? recommendError = null,Object? categoriesError = null,Object? productsByCategoryError = null,Object? categoryId = null,}) {
  return _then(HomeState(
bannersStatus: null == bannersStatus ? _self.bannersStatus : bannersStatus // ignore: cast_nullable_to_non_nullable
as HomeStatus,categoriesStatus: null == categoriesStatus ? _self.categoriesStatus : categoriesStatus // ignore: cast_nullable_to_non_nullable
as HomeStatus,recommendStatus: null == recommendStatus ? _self.recommendStatus : recommendStatus // ignore: cast_nullable_to_non_nullable
as HomeStatus,productsByCategoryStatus: null == productsByCategoryStatus ? _self.productsByCategoryStatus : productsByCategoryStatus // ignore: cast_nullable_to_non_nullable
as HomeStatus,banners: null == banners ? _self.banners : banners // ignore: cast_nullable_to_non_nullable
as List<BannersModel>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoriesModel>,recommend: null == recommend ? _self.recommend : recommend // ignore: cast_nullable_to_non_nullable
as List<ProductsModel>,productsByCategory: null == productsByCategory ? _self.productsByCategory : productsByCategory // ignore: cast_nullable_to_non_nullable
as List<ProductsModel>,bannersError: null == bannersError ? _self.bannersError : bannersError // ignore: cast_nullable_to_non_nullable
as String,recommendError: null == recommendError ? _self.recommendError : recommendError // ignore: cast_nullable_to_non_nullable
as String,categoriesError: null == categoriesError ? _self.categoriesError : categoriesError // ignore: cast_nullable_to_non_nullable
as String,productsByCategoryError: null == productsByCategoryError ? _self.productsByCategoryError : productsByCategoryError // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomeStatus bannersStatus,  HomeStatus categoriesStatus,  HomeStatus recommendStatus,  HomeStatus productsByCategoryStatus,  List<BannersModel> banners,  List<CategoriesModel> categories,  List<ProductsModel> recommend,  List<ProductsModel> productsByCategory,  String bannersError,  String recommendError,  String categoriesError,  String productsByCategoryError,  int categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.bannersStatus,_that.categoriesStatus,_that.recommendStatus,_that.productsByCategoryStatus,_that.banners,_that.categories,_that.recommend,_that.productsByCategory,_that.bannersError,_that.recommendError,_that.categoriesError,_that.productsByCategoryError,_that.categoryId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomeStatus bannersStatus,  HomeStatus categoriesStatus,  HomeStatus recommendStatus,  HomeStatus productsByCategoryStatus,  List<BannersModel> banners,  List<CategoriesModel> categories,  List<ProductsModel> recommend,  List<ProductsModel> productsByCategory,  String bannersError,  String recommendError,  String categoriesError,  String productsByCategoryError,  int categoryId)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.bannersStatus,_that.categoriesStatus,_that.recommendStatus,_that.productsByCategoryStatus,_that.banners,_that.categories,_that.recommend,_that.productsByCategory,_that.bannersError,_that.recommendError,_that.categoriesError,_that.productsByCategoryError,_that.categoryId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomeStatus bannersStatus,  HomeStatus categoriesStatus,  HomeStatus recommendStatus,  HomeStatus productsByCategoryStatus,  List<BannersModel> banners,  List<CategoriesModel> categories,  List<ProductsModel> recommend,  List<ProductsModel> productsByCategory,  String bannersError,  String recommendError,  String categoriesError,  String productsByCategoryError,  int categoryId)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.bannersStatus,_that.categoriesStatus,_that.recommendStatus,_that.productsByCategoryStatus,_that.banners,_that.categories,_that.recommend,_that.productsByCategory,_that.bannersError,_that.recommendError,_that.categoriesError,_that.productsByCategoryError,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.bannersStatus = HomeStatus.initial, this.categoriesStatus = HomeStatus.initial, this.recommendStatus = HomeStatus.initial, this.productsByCategoryStatus = HomeStatus.initial,  List<BannersModel> banners = const [],  List<CategoriesModel> categories = const [],  List<ProductsModel> recommend = const [],  List<ProductsModel> productsByCategory = const [], this.bannersError = '', this.recommendError = '', this.categoriesError = '', this.productsByCategoryError = '', this.categoryId = 0}): _banners = banners,_categories = categories,_recommend = recommend,_productsByCategory = productsByCategory;
  

@override@JsonKey() final  HomeStatus bannersStatus;
@override@JsonKey() final  HomeStatus categoriesStatus;
@override@JsonKey() final  HomeStatus recommendStatus;
@override@JsonKey() final  HomeStatus productsByCategoryStatus;
 final  List<BannersModel> _banners;
@override@JsonKey() List<BannersModel> get banners {
  if (_banners is EqualUnmodifiableListView) return _banners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_banners);
}

 final  List<CategoriesModel> _categories;
@override@JsonKey() List<CategoriesModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<ProductsModel> _recommend;
@override@JsonKey() List<ProductsModel> get recommend {
  if (_recommend is EqualUnmodifiableListView) return _recommend;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recommend);
}

 final  List<ProductsModel> _productsByCategory;
@override@JsonKey() List<ProductsModel> get productsByCategory {
  if (_productsByCategory is EqualUnmodifiableListView) return _productsByCategory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productsByCategory);
}

@override@JsonKey() final  String bannersError;
@override@JsonKey() final  String recommendError;
@override@JsonKey() final  String categoriesError;
@override@JsonKey() final  String productsByCategoryError;
@override@JsonKey() final  int categoryId;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.bannersStatus, bannersStatus) || other.bannersStatus == bannersStatus)&&(identical(other.categoriesStatus, categoriesStatus) || other.categoriesStatus == categoriesStatus)&&(identical(other.recommendStatus, recommendStatus) || other.recommendStatus == recommendStatus)&&(identical(other.productsByCategoryStatus, productsByCategoryStatus) || other.productsByCategoryStatus == productsByCategoryStatus)&&const DeepCollectionEquality().equals(other.banners, _banners)&&const DeepCollectionEquality().equals(other.categories, _categories)&&const DeepCollectionEquality().equals(other.recommend, _recommend)&&const DeepCollectionEquality().equals(other.productsByCategory, _productsByCategory)&&(identical(other.bannersError, bannersError) || other.bannersError == bannersError)&&(identical(other.recommendError, recommendError) || other.recommendError == recommendError)&&(identical(other.categoriesError, categoriesError) || other.categoriesError == categoriesError)&&(identical(other.productsByCategoryError, productsByCategoryError) || other.productsByCategoryError == productsByCategoryError)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,bannersStatus,categoriesStatus,recommendStatus,productsByCategoryStatus,const DeepCollectionEquality().hash(_banners),const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_recommend),const DeepCollectionEquality().hash(_productsByCategory),bannersError,recommendError,categoriesError,productsByCategoryError,categoryId);
}

@override
String toString() {
    return 'HomeState(bannersStatus: $bannersStatus, categoriesStatus: $categoriesStatus, recommendStatus: $recommendStatus, productsByCategoryStatus: $productsByCategoryStatus, banners: $banners, categories: $categories, recommend: $recommend, productsByCategory: $productsByCategory, bannersError: $bannersError, recommendError: $recommendError, categoriesError: $categoriesError, productsByCategoryError: $productsByCategoryError, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 HomeStatus bannersStatus, HomeStatus categoriesStatus, HomeStatus recommendStatus, HomeStatus productsByCategoryStatus, List<BannersModel> banners, List<CategoriesModel> categories, List<ProductsModel> recommend, List<ProductsModel> productsByCategory, String bannersError, String recommendError, String categoriesError, String productsByCategoryError, int categoryId
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bannersStatus = null,Object? categoriesStatus = null,Object? recommendStatus = null,Object? productsByCategoryStatus = null,Object? banners = null,Object? categories = null,Object? recommend = null,Object? productsByCategory = null,Object? bannersError = null,Object? recommendError = null,Object? categoriesError = null,Object? productsByCategoryError = null,Object? categoryId = null,}) {
  return _then(_HomeState(
bannersStatus: null == bannersStatus ? _self.bannersStatus : bannersStatus // ignore: cast_nullable_to_non_nullable
as HomeStatus,categoriesStatus: null == categoriesStatus ? _self.categoriesStatus : categoriesStatus // ignore: cast_nullable_to_non_nullable
as HomeStatus,recommendStatus: null == recommendStatus ? _self.recommendStatus : recommendStatus // ignore: cast_nullable_to_non_nullable
as HomeStatus,productsByCategoryStatus: null == productsByCategoryStatus ? _self.productsByCategoryStatus : productsByCategoryStatus // ignore: cast_nullable_to_non_nullable
as HomeStatus,banners: null == banners ? _self._banners : banners // ignore: cast_nullable_to_non_nullable
as List<BannersModel>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoriesModel>,recommend: null == recommend ? _self._recommend : recommend // ignore: cast_nullable_to_non_nullable
as List<ProductsModel>,productsByCategory: null == productsByCategory ? _self._productsByCategory : productsByCategory // ignore: cast_nullable_to_non_nullable
as List<ProductsModel>,bannersError: null == bannersError ? _self.bannersError : bannersError // ignore: cast_nullable_to_non_nullable
as String,recommendError: null == recommendError ? _self.recommendError : recommendError // ignore: cast_nullable_to_non_nullable
as String,categoriesError: null == categoriesError ? _self.categoriesError : categoriesError // ignore: cast_nullable_to_non_nullable
as String,productsByCategoryError: null == productsByCategoryError ? _self.productsByCategoryError : productsByCategoryError // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
