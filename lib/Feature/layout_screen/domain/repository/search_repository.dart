import 'package:ecommerce_app/Feature/layout_screen/domain/entities/product_entity.dart';

abstract class SearchRepository{
  Future<List<ProductEntity>> search({String? query});
}