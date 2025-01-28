import '../../../domain/entities/product_entity.dart';

class SearchState{

}
class InitialSearchState extends SearchState{

}
class LoadingSearchState extends SearchState{

}
class FailedSearchState extends SearchState{
  String errMessage;
  FailedSearchState(this.errMessage);
}
class SuccessfulSearchState extends SearchState{
  List<ProductEntity> products;
  SuccessfulSearchState(this.products);
}