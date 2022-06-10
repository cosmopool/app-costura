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

class CouldNotAddClient extends Failure {
  @override
  String get message => "Error trying to add client";

  @override
  List<Object?> get props => [];
}

class CouldNotEditClient extends Failure {
  @override
  String get message => "Error trying to edit client properties";

  @override
  List<Object?> get props => [];
}
