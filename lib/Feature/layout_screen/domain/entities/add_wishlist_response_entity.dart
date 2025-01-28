import 'package:equatable/equatable.dart';

class AddWishlistResponseEntity extends Equatable {
  String statusMessage;
  String message;
  List<dynamic> data;

  AddWishlistResponseEntity(
      {required this.statusMessage, required this.message, required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}
