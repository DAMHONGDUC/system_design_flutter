import 'package:equatable/equatable.dart';

/// Represents a defined route in the application.
class SdRouter extends Equatable {
  const SdRouter({
    required this.name,
    @Deprecated(
      'Use fullPath instead. This property will be removed in future versions.',
    )
    required this.path,
    required this.fullPath,
  });

  /// The path segment for this route (e.g., 'login', 'home').
  final String path;

  /// A unique name for this route (e.g., 'loginRoute', 'homeRoute').
  final String name;

  /// The complete path to this route (e.g., '/auth/login', '/base/home').
  final String fullPath;

  @override
  List<Object?> get props => [path, name, fullPath];
}
