import 'package:ecommerce_app/Feature/layout_screen/domain/repository/search_repository.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/product_cubit/product_cubit.dart';
import 'package:ecommerce_app/core/Services/servier_locator.dart';

import '../../domain/entities/product_entity.dart';

class SearchRepositoryImpl implements SearchRepository {
  List<ProductEntity> products = getIt<ProductCubit>().products;

  @override
  Future<List<ProductEntity>> search({String? query}) async {
    await Future.delayed(
        const Duration(milliseconds: 300)); // Simulate network delay
    return products.where((product) =>
        product.title!.toUpperCase().contains(query!.toUpperCase()))
        .toList();
  }

}