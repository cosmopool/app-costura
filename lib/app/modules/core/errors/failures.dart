import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  get message;
}

class CouldNotFetchClients extends Failure {
  @override
  String get message => "Error trying to fetch clients";

  @override
  List<Object?> get props => [];
}
