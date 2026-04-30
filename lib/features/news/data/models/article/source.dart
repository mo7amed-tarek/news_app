import 'package:equatable/equatable.dart';

class Source extends Equatable {
  Source({this.id, this.name});

  String? id;
  String? name;

  static Source empty() => Source();

  factory Source.fromJson(Map<String, dynamic>? sourceData) {
    if (sourceData != null && sourceData.isNotEmpty) {
      return Source(
        id: sourceData['id'] as String? ?? "unKnown",
        name: sourceData['name'] as String?,
      );
    } else {
      return empty();
    }
  }

  @override
  List<Object?> get props => [id, name];
}
