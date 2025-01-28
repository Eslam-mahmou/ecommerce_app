import '../../../domain/entities/sub_category_entity.dart';

abstract class SubCategoriesState{

}
class InitialSubCategoriesState extends SubCategoriesState{

}
class LoadingSubCategoriesState extends SubCategoriesState{

}
class SuccessSubCategoriesState extends SubCategoriesState{
List<SubCategoryEntity> subCategories;
SuccessSubCategoriesState(this.subCategories);
}
class FailureSubCategoriesState extends SubCategoriesState{
final String errMessage;
FailureSubCategoriesState(this.errMessage);
}
class ChoosePageState extends SubCategoriesState{


}
class ChangeIndexSubCategoriesState extends SubCategoriesState{

}
class ChangeLoading extends SubCategoriesState{

}