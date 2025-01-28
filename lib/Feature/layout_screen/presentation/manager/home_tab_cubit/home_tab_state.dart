import 'package:ecommerce_app/Feature/layout_screen/domain/entities/category_or_brand_entity.dart';

abstract class HomeTabState{

}
class InitialCategoryHomeTabState extends HomeTabState{

}
class LoadingCategoryHomeTabState extends HomeTabState{

}
class SuccessCategoryHomeTabState extends HomeTabState{

}
class FailureCategoryHomeTabState extends HomeTabState{
final String errorMessage;
FailureCategoryHomeTabState(this.errorMessage);
}
class ChangeIndexCategory extends HomeTabState{

}
class InitialBrandHomeTabState extends HomeTabState{

}
class LoadingBrandHomeTabState extends HomeTabState{

}
class SuccessBrandHomeTabState extends HomeTabState{
}
class FailureBrandHomeTabState extends HomeTabState{
  final String errorMessage;
  FailureBrandHomeTabState(this.errorMessage);
}