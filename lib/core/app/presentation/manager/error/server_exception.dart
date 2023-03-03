


import 'package:weather_app/core/app/presentation/manager/net_work/error_message_model.dart';

class ServerException implements Exception{

  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});



}