import '../../../domain/entities/product_entity.dart';

abstract class ProductSpecificState{

}
class InitialProductSpecificState extends ProductSpecificState{

}
class LoadingProductSpecificState extends ProductSpecificState{

}
class SuccessProductSpecificState extends ProductSpecificState{
ProductEntity product;
SuccessProductSpecificState(this.product);
}
class FailureProductSpecificState extends ProductSpecificState{
final String errMessage;
FailureProductSpecificState(this.errMessage);
}
class IncrementProductSpecificState extends ProductSpecificState{

}
class DecrementProductSpecificState extends ProductSpecificState{

}