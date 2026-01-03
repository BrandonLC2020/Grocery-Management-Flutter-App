// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'category_dto.dart';

class CategoryDtoMapper extends ClassMapperBase<CategoryDto> {
  CategoryDtoMapper._();

  static CategoryDtoMapper? _instance;
  static CategoryDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoryDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CategoryDto';

  static int _$id(CategoryDto v) => v.id;
  static const Field<CategoryDto, int> _f$id = Field('id', _$id);
  static String _$status(CategoryDto v) => v.status;
  static const Field<CategoryDto, String> _f$status = Field('status', _$status);
  static DateTime _$createdAt(CategoryDto v) => v.createdAt;
  static const Field<CategoryDto, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
  );
  static DateTime _$updatedAt(CategoryDto v) => v.updatedAt;
  static const Field<CategoryDto, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
  );
  static String _$name(CategoryDto v) => v.name;
  static const Field<CategoryDto, String> _f$name = Field('name', _$name);
  static String? _$description(CategoryDto v) => v.description;
  static const Field<CategoryDto, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static int? _$createdBy(CategoryDto v) => v.createdBy;
  static const Field<CategoryDto, int> _f$createdBy = Field(
    'createdBy',
    _$createdBy,
    key: r'created_by',
    opt: true,
  );
  static int? _$updatedBy(CategoryDto v) => v.updatedBy;
  static const Field<CategoryDto, int> _f$updatedBy = Field(
    'updatedBy',
    _$updatedBy,
    key: r'updated_by',
    opt: true,
  );

  @override
  final MappableFields<CategoryDto> fields = const {
    #id: _f$id,
    #status: _f$status,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #name: _f$name,
    #description: _f$description,
    #createdBy: _f$createdBy,
    #updatedBy: _f$updatedBy,
  };

  static CategoryDto _instantiate(DecodingData data) {
    return CategoryDto(
      id: data.dec(_f$id),
      status: data.dec(_f$status),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      name: data.dec(_f$name),
      description: data.dec(_f$description),
      createdBy: data.dec(_f$createdBy),
      updatedBy: data.dec(_f$updatedBy),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CategoryDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CategoryDto>(map);
  }

  static CategoryDto fromJson(String json) {
    return ensureInitialized().decodeJson<CategoryDto>(json);
  }
}

mixin CategoryDtoMappable {
  String toJson() {
    return CategoryDtoMapper.ensureInitialized().encodeJson<CategoryDto>(
      this as CategoryDto,
    );
  }

  Map<String, dynamic> toMap() {
    return CategoryDtoMapper.ensureInitialized().encodeMap<CategoryDto>(
      this as CategoryDto,
    );
  }

  CategoryDtoCopyWith<CategoryDto, CategoryDto, CategoryDto> get copyWith =>
      _CategoryDtoCopyWithImpl<CategoryDto, CategoryDto>(
        this as CategoryDto,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CategoryDtoMapper.ensureInitialized().stringifyValue(
      this as CategoryDto,
    );
  }

  @override
  bool operator ==(Object other) {
    return CategoryDtoMapper.ensureInitialized().equalsValue(
      this as CategoryDto,
      other,
    );
  }

  @override
  int get hashCode {
    return CategoryDtoMapper.ensureInitialized().hashValue(this as CategoryDto);
  }
}

extension CategoryDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CategoryDto, $Out> {
  CategoryDtoCopyWith<$R, CategoryDto, $Out> get $asCategoryDto =>
      $base.as((v, t, t2) => _CategoryDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CategoryDtoCopyWith<$R, $In extends CategoryDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? id,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? description,
    int? createdBy,
    int? updatedBy,
  });
  CategoryDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CategoryDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CategoryDto, $Out>
    implements CategoryDtoCopyWith<$R, CategoryDto, $Out> {
  _CategoryDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CategoryDto> $mapper =
      CategoryDtoMapper.ensureInitialized();
  @override
  $R call({
    int? id,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    Object? description = $none,
    Object? createdBy = $none,
    Object? updatedBy = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (status != null) #status: status,
      if (createdAt != null) #createdAt: createdAt,
      if (updatedAt != null) #updatedAt: updatedAt,
      if (name != null) #name: name,
      if (description != $none) #description: description,
      if (createdBy != $none) #createdBy: createdBy,
      if (updatedBy != $none) #updatedBy: updatedBy,
    }),
  );
  @override
  CategoryDto $make(CopyWithData data) => CategoryDto(
    id: data.get(#id, or: $value.id),
    status: data.get(#status, or: $value.status),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    name: data.get(#name, or: $value.name),
    description: data.get(#description, or: $value.description),
    createdBy: data.get(#createdBy, or: $value.createdBy),
    updatedBy: data.get(#updatedBy, or: $value.updatedBy),
  );

  @override
  CategoryDtoCopyWith<$R2, CategoryDto, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CategoryDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

