import 'package:ecommerce_app/Feature/layout_screen/domain/entities/product_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/repository/search_repository.dart';

class SearchItemUseCase {
  SearchRepository searchRepository ;
  SearchItemUseCase(this.searchRepository);

  Future<List<ProductEntity>> searchProducts({String? query}) async {
    return await searchRepository.search(query:query);
  }
}