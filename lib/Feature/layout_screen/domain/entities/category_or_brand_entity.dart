import 'package:equatable/equatable.dart';

class CategoryOrBrandEntity extends Equatable {
  final String id;
  final String name;
  final String image;
  final String?slug;
const  CategoryOrBrandEntity(
      {required this.id, required this.name, required this.image,this.slug});

  @override
  List<Object?> get props => [id, name];
}
