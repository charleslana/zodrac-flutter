import 'dart:convert';

class PageableContentModel {
  PageableContentModel({
    required this.content,
    required this.pageable,
    required this.last,
    required this.totalPages,
    required this.totalElements,
    required this.size,
    required this.number,
    required this.sort,
    required this.first,
    required this.numberOfElements,
    required this.empty,
  });

  factory PageableContentModel.fromJson(String source) =>
      PageableContentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory PageableContentModel.fromMap(Map<String, dynamic> map) {
    return PageableContentModel(
      content: List<dynamic>.from(map['content'] as List<dynamic>),
      pageable: PageableModel.fromMap(map['pageable'] as Map<String, dynamic>),
      last: map['last'] as bool,
      totalPages: map['totalPages'] as int,
      totalElements: map['totalElements'] as int,
      size: map['size'] as int,
      number: map['number'] as int,
      sort: SortModel.fromMap(map['sort'] as Map<String, dynamic>),
      first: map['first'] as bool,
      numberOfElements: map['numberOfElements'] as int,
      empty: map['empty'] as bool,
    );
  }

  final List<dynamic> content;
  final PageableModel pageable;
  final bool last;
  final int totalPages;
  final int totalElements;
  final int size;
  final int number;
  final SortModel sort;
  final bool first;
  final int numberOfElements;
  final bool empty;

  PageableContentModel copyWith({
    List<dynamic>? content,
    PageableModel? pageable,
    bool? last,
    int? totalPages,
    int? totalElements,
    int? size,
    int? number,
    SortModel? sort,
    bool? first,
    int? numberOfElements,
    bool? empty,
  }) {
    return PageableContentModel(
      content: content ?? this.content,
      pageable: pageable ?? this.pageable,
      last: last ?? this.last,
      totalPages: totalPages ?? this.totalPages,
      totalElements: totalElements ?? this.totalElements,
      size: size ?? this.size,
      number: number ?? this.number,
      sort: sort ?? this.sort,
      first: first ?? this.first,
      numberOfElements: numberOfElements ?? this.numberOfElements,
      empty: empty ?? this.empty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'pageable': pageable.toMap(),
      'last': last,
      'totalPages': totalPages,
      'totalElements': totalElements,
      'size': size,
      'number': number,
      'sort': sort.toMap(),
      'first': first,
      'numberOfElements': numberOfElements,
      'empty': empty,
    };
  }

  String toJson() => json.encode(toMap());
}

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
