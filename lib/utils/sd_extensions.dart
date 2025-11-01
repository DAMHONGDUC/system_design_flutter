import 'dart:math';

extension StringExtensions on String? {
  bool get isNullOrEmpty {
    return this == null || (this?.isEmpty ?? true);
  }

  bool get isNotNullAndNotEmpty {
    return !isNullOrEmpty;
  }
}

extension ListExtensions on List? {
  bool get isNullOrEmpty {
    return this == null || (this?.isEmpty ?? true);
  }

  bool get isNotNullAndNotEmpty {
    return !isNullOrEmpty;
  }
}

extension RandomItem<T> on List<T> {
  T getRandomItem() {
    if (isEmpty) {
      throw StateError('Cannot get random item from an empty list');
    }
    final random = Random();
    return this[random.nextInt(length)];
  }
}
