import 'package:equatable/equatable.dart';

class SdRouter extends Equatable {
  SdRouter({required this.name, required this.path, required this.fullPath});

  final String path;
  final String name;
  final String fullPath;

  @override
  List<Object?> get props => [path, name, fullPath];
}
