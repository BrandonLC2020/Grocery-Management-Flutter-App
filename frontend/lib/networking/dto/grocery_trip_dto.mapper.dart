// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'grocery_trip_dto.dart';

class GroceryTripDtoMapper extends ClassMapperBase<GroceryTripDto> {
  GroceryTripDtoMapper._();

  static GroceryTripDtoMapper? _instance;
  static GroceryTripDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GroceryTripDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GroceryTripDto';

  static int _$id(GroceryTripDto v) => v.id;
  static const Field<GroceryTripDto, int> _f$id = Field('id', _$id);
  static String _$status(GroceryTripDto v) => v.status;
  static const Field<GroceryTripDto, String> _f$status = Field(
    'status',
    _$status,
  );
  static DateTime _$createdAt(GroceryTripDto v) => v.createdAt;
  static const Field<GroceryTripDto, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
  );
  static DateTime _$updatedAt(GroceryTripDto v) => v.updatedAt;
  static const Field<GroceryTripDto, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
  );
  static int _$user(GroceryTripDto v) => v.user;
  static const Field<GroceryTripDto, int> _f$user = Field('user', _$user);
  static int _$store(GroceryTripDto v) => v.store;
  static const Field<GroceryTripDto, int> _f$store = Field('store', _$store);
  static DateTime _$tripDate(GroceryTripDto v) => v.tripDate;
  static const Field<GroceryTripDto, DateTime> _f$tripDate = Field(
    'tripDate',
    _$tripDate,
    key: r'trip_date',
  );
  static double _$totalSpent(GroceryTripDto v) => v.totalSpent;
  static const Field<GroceryTripDto, double> _f$totalSpent = Field(
    'totalSpent',
    _$totalSpent,
    key: r'total_spent',
  );
  static int? _$createdBy(GroceryTripDto v) => v.createdBy;
  static const Field<GroceryTripDto, int> _f$createdBy = Field(
    'createdBy',
    _$createdBy,
    key: r'created_by',
    opt: true,
  );
  static int? _$updatedBy(GroceryTripDto v) => v.updatedBy;
  static const Field<GroceryTripDto, int> _f$updatedBy = Field(
    'updatedBy',
    _$updatedBy,
    key: r'updated_by',
    opt: true,
  );

  @override
  final MappableFields<GroceryTripDto> fields = const {
    #id: _f$id,
    #status: _f$status,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #user: _f$user,
    #store: _f$store,
    #tripDate: _f$tripDate,
    #totalSpent: _f$totalSpent,
    #createdBy: _f$createdBy,
    #updatedBy: _f$updatedBy,
  };

  static GroceryTripDto _instantiate(DecodingData data) {
    return GroceryTripDto(
      id: data.dec(_f$id),
      status: data.dec(_f$status),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      user: data.dec(_f$user),
      store: data.dec(_f$store),
      tripDate: data.dec(_f$tripDate),
      totalSpent: data.dec(_f$totalSpent),
      createdBy: data.dec(_f$createdBy),
      updatedBy: data.dec(_f$updatedBy),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static GroceryTripDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GroceryTripDto>(map);
  }

  static GroceryTripDto fromJson(String json) {
    return ensureInitialized().decodeJson<GroceryTripDto>(json);
  }
}

mixin GroceryTripDtoMappable {
  String toJson() {
    return GroceryTripDtoMapper.ensureInitialized().encodeJson<GroceryTripDto>(
      this as GroceryTripDto,
    );
  }

  Map<String, dynamic> toMap() {
    return GroceryTripDtoMapper.ensureInitialized().encodeMap<GroceryTripDto>(
      this as GroceryTripDto,
    );
  }

  GroceryTripDtoCopyWith<GroceryTripDto, GroceryTripDto, GroceryTripDto>
  get copyWith => _GroceryTripDtoCopyWithImpl<GroceryTripDto, GroceryTripDto>(
    this as GroceryTripDto,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return GroceryTripDtoMapper.ensureInitialized().stringifyValue(
      this as GroceryTripDto,
    );
  }

  @override
  bool operator ==(Object other) {
    return GroceryTripDtoMapper.ensureInitialized().equalsValue(
      this as GroceryTripDto,
      other,
    );
  }

  @override
  int get hashCode {
    return GroceryTripDtoMapper.ensureInitialized().hashValue(
      this as GroceryTripDto,
    );
  }
}

extension GroceryTripDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GroceryTripDto, $Out> {
  GroceryTripDtoCopyWith<$R, GroceryTripDto, $Out> get $asGroceryTripDto =>
      $base.as((v, t, t2) => _GroceryTripDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class GroceryTripDtoCopyWith<$R, $In extends GroceryTripDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? id,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? user,
    int? store,
    DateTime? tripDate,
    double? totalSpent,
    int? createdBy,
    int? updatedBy,
  });
  GroceryTripDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _GroceryTripDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GroceryTripDto, $Out>
    implements GroceryTripDtoCopyWith<$R, GroceryTripDto, $Out> {
  _GroceryTripDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GroceryTripDto> $mapper =
      GroceryTripDtoMapper.ensureInitialized();
  @override
  $R call({
    int? id,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? user,
    int? store,
    DateTime? tripDate,
    double? totalSpent,
    Object? createdBy = $none,
    Object? updatedBy = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (status != null) #status: status,
      if (createdAt != null) #createdAt: createdAt,
      if (updatedAt != null) #updatedAt: updatedAt,
      if (user != null) #user: user,
      if (store != null) #store: store,
      if (tripDate != null) #tripDate: tripDate,
      if (totalSpent != null) #totalSpent: totalSpent,
      if (createdBy != $none) #createdBy: createdBy,
      if (updatedBy != $none) #updatedBy: updatedBy,
    }),
  );
  @override
  GroceryTripDto $make(CopyWithData data) => GroceryTripDto(
    id: data.get(#id, or: $value.id),
    status: data.get(#status, or: $value.status),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    user: data.get(#user, or: $value.user),
    store: data.get(#store, or: $value.store),
    tripDate: data.get(#tripDate, or: $value.tripDate),
    totalSpent: data.get(#totalSpent, or: $value.totalSpent),
    createdBy: data.get(#createdBy, or: $value.createdBy),
    updatedBy: data.get(#updatedBy, or: $value.updatedBy),
  );

  @override
  GroceryTripDtoCopyWith<$R2, GroceryTripDto, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _GroceryTripDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

