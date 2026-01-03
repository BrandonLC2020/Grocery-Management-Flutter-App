// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'address_dto.dart';

class AddressDtoMapper extends ClassMapperBase<AddressDto> {
  AddressDtoMapper._();

  static AddressDtoMapper? _instance;
  static AddressDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AddressDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AddressDto';

  static int _$id(AddressDto v) => v.id;
  static const Field<AddressDto, int> _f$id = Field('id', _$id);
  static String _$status(AddressDto v) => v.status;
  static const Field<AddressDto, String> _f$status = Field('status', _$status);
  static DateTime _$createdAt(AddressDto v) => v.createdAt;
  static const Field<AddressDto, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
  );
  static DateTime _$updatedAt(AddressDto v) => v.updatedAt;
  static const Field<AddressDto, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
  );
  static String _$addressLine(AddressDto v) => v.addressLine;
  static const Field<AddressDto, String> _f$addressLine = Field(
    'addressLine',
    _$addressLine,
    key: r'address_line',
  );
  static String _$city(AddressDto v) => v.city;
  static const Field<AddressDto, String> _f$city = Field('city', _$city);
  static String _$state(AddressDto v) => v.state;
  static const Field<AddressDto, String> _f$state = Field('state', _$state);
  static String _$zipCode(AddressDto v) => v.zipCode;
  static const Field<AddressDto, String> _f$zipCode = Field(
    'zipCode',
    _$zipCode,
    key: r'zip_code',
  );
  static String _$country(AddressDto v) => v.country;
  static const Field<AddressDto, String> _f$country = Field(
    'country',
    _$country,
  );
  static int? _$createdBy(AddressDto v) => v.createdBy;
  static const Field<AddressDto, int> _f$createdBy = Field(
    'createdBy',
    _$createdBy,
    key: r'created_by',
    opt: true,
  );
  static int? _$updatedBy(AddressDto v) => v.updatedBy;
  static const Field<AddressDto, int> _f$updatedBy = Field(
    'updatedBy',
    _$updatedBy,
    key: r'updated_by',
    opt: true,
  );

  @override
  final MappableFields<AddressDto> fields = const {
    #id: _f$id,
    #status: _f$status,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #addressLine: _f$addressLine,
    #city: _f$city,
    #state: _f$state,
    #zipCode: _f$zipCode,
    #country: _f$country,
    #createdBy: _f$createdBy,
    #updatedBy: _f$updatedBy,
  };

  static AddressDto _instantiate(DecodingData data) {
    return AddressDto(
      id: data.dec(_f$id),
      status: data.dec(_f$status),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      addressLine: data.dec(_f$addressLine),
      city: data.dec(_f$city),
      state: data.dec(_f$state),
      zipCode: data.dec(_f$zipCode),
      country: data.dec(_f$country),
      createdBy: data.dec(_f$createdBy),
      updatedBy: data.dec(_f$updatedBy),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AddressDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AddressDto>(map);
  }

  static AddressDto fromJson(String json) {
    return ensureInitialized().decodeJson<AddressDto>(json);
  }
}

mixin AddressDtoMappable {
  String toJson() {
    return AddressDtoMapper.ensureInitialized().encodeJson<AddressDto>(
      this as AddressDto,
    );
  }

  Map<String, dynamic> toMap() {
    return AddressDtoMapper.ensureInitialized().encodeMap<AddressDto>(
      this as AddressDto,
    );
  }

  AddressDtoCopyWith<AddressDto, AddressDto, AddressDto> get copyWith =>
      _AddressDtoCopyWithImpl<AddressDto, AddressDto>(
        this as AddressDto,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AddressDtoMapper.ensureInitialized().stringifyValue(
      this as AddressDto,
    );
  }

  @override
  bool operator ==(Object other) {
    return AddressDtoMapper.ensureInitialized().equalsValue(
      this as AddressDto,
      other,
    );
  }

  @override
  int get hashCode {
    return AddressDtoMapper.ensureInitialized().hashValue(this as AddressDto);
  }
}

extension AddressDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AddressDto, $Out> {
  AddressDtoCopyWith<$R, AddressDto, $Out> get $asAddressDto =>
      $base.as((v, t, t2) => _AddressDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AddressDtoCopyWith<$R, $In extends AddressDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? id,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? addressLine,
    String? city,
    String? state,
    String? zipCode,
    String? country,
    int? createdBy,
    int? updatedBy,
  });
  AddressDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AddressDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AddressDto, $Out>
    implements AddressDtoCopyWith<$R, AddressDto, $Out> {
  _AddressDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AddressDto> $mapper =
      AddressDtoMapper.ensureInitialized();
  @override
  $R call({
    int? id,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? addressLine,
    String? city,
    String? state,
    String? zipCode,
    String? country,
    Object? createdBy = $none,
    Object? updatedBy = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (status != null) #status: status,
      if (createdAt != null) #createdAt: createdAt,
      if (updatedAt != null) #updatedAt: updatedAt,
      if (addressLine != null) #addressLine: addressLine,
      if (city != null) #city: city,
      if (state != null) #state: state,
      if (zipCode != null) #zipCode: zipCode,
      if (country != null) #country: country,
      if (createdBy != $none) #createdBy: createdBy,
      if (updatedBy != $none) #updatedBy: updatedBy,
    }),
  );
  @override
  AddressDto $make(CopyWithData data) => AddressDto(
    id: data.get(#id, or: $value.id),
    status: data.get(#status, or: $value.status),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    addressLine: data.get(#addressLine, or: $value.addressLine),
    city: data.get(#city, or: $value.city),
    state: data.get(#state, or: $value.state),
    zipCode: data.get(#zipCode, or: $value.zipCode),
    country: data.get(#country, or: $value.country),
    createdBy: data.get(#createdBy, or: $value.createdBy),
    updatedBy: data.get(#updatedBy, or: $value.updatedBy),
  );

  @override
  AddressDtoCopyWith<$R2, AddressDto, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AddressDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

