import 'dart:convert';

class PageableModel {
  PageableModel({
    required this.sort,
    required this.offset,
    required this.pageNumber,
    required this.pageSize,
    required this.paged,
    required this.unpaged,
  });

  factory PageableModel.fromJson(String source) =>
      PageableModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory PageableModel.fromMap(Map<String, dynamic> map) {
    return PageableModel(
      sort: SortModel.fromMap(map['sort'] as Map<String, dynamic>),
      offset: map['offset'] as int,
      pageNumber: map['pageNumber'] as int,
      pageSize: map['pageSize'] as int,
      paged: map['paged'] as bool,
      unpaged: map['unpaged'] as bool,
    );
  }

  final SortModel sort;
  final int offset;
  final int pageNumber;
  final int pageSize;
  final bool paged;
  final bool unpaged;

  PageableModel copyWith({
    SortModel? sort,
    int? offset,
    int? pageNumber,
    int? pageSize,
    bool? paged,
    bool? unpaged,
  }) {
    return PageableModel(
      sort: sort ?? this.sort,
      offset: offset ?? this.offset,
      pageNumber: pageNumber ?? this.pageNumber,
      pageSize: pageSize ?? this.pageSize,
      paged: paged ?? this.paged,
      unpaged: unpaged ?? this.unpaged,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sort': sort.toMap(),
      'offset': offset,
      'pageNumber': pageNumber,
      'pageSize': pageSize,
      'paged': paged,
      'unpaged': unpaged,
    };
  }

  String toJson() => json.encode(toMap());
}

class SortModel {
  SortModel({
    required this.empty,
    required this.sorted,
    required this.unsorted,
  });

  factory SortModel.fromJson(String source) =>
      SortModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory SortModel.fromMap(Map<String, dynamic> map) {
    return SortModel(
      empty: map['empty'] as bool,
      sorted: map['sorted'] as bool,
      unsorted: map['unsorted'] as bool,
    );
  }

  final bool empty;
  final bool sorted;
  final bool unsorted;

  SortModel copyWith({
    bool? empty,
    bool? sorted,
    bool? unsorted,
  }) {
    return SortModel(
      empty: empty ?? this.empty,
      sorted: sorted ?? this.sorted,
      unsorted: unsorted ?? this.unsorted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'empty': empty,
      'sorted': sorted,
      'unsorted': unsorted,
    };
  }

  String toJson() => json.encode(toMap());
}
