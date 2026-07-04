import 'package:equatable/equatable.dart';

class Pagination extends Equatable {
  final int page;
  final int limit;
  final int total;
  final int pages;
  final bool hasNext;
  final bool hasPrev;

  const Pagination({
    required this.page,
    required this.limit,
    required this.total,
    required this.pages,
    required this.hasNext,
    required this.hasPrev,
  });

  @override
  List<Object?> get props => [page, limit, total, pages, hasNext, hasPrev];
}
