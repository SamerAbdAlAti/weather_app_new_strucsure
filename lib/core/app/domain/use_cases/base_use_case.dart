import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/app/presentation/manager/error/server_failure.dart';

abstract class BaseUseCase<T, P> {
  Future<Either<Failure,T>> call({required P parameter});
}

class NoParameter extends Equatable {
  const NoParameter();

  @override
  List<Object> get props => [];
}
