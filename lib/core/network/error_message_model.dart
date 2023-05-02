
import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable{

  final int statusCode;
  final String statusMessge;
  final bool success;

 const ErrorMessageModel
 ({
  required this.statusCode,
  required this.statusMessge,
  required this.success
  });


  factory ErrorMessageModel.fromJson(Map<String,dynamic>json){
    return ErrorMessageModel(
      statusCode:json ['status_code'],
      statusMessge:json ['status_messge'],
      success:json ['success']);
  }
  
  @override
  List<Object?> get props => [
    statusCode,
    statusMessge,
    success
  ];
}
