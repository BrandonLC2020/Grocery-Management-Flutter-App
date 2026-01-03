// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'monthly_budget_dto.dart';

class MonthlyBudgetDtoMapper extends ClassMapperBase<MonthlyBudgetDto> {
  MonthlyBudgetDtoMapper._();

  static MonthlyBudgetDtoMapper? _instance;
  static MonthlyBudgetDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MonthlyBudgetDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MonthlyBudgetDto';

  static int _$id(MonthlyBudgetDto v) => v.id;
  static const Field<MonthlyBudgetDto, int> _f$id = Field('id', _$id);
  static String _$status(MonthlyBudgetDto v) => v.status;
  static const Field<MonthlyBudgetDto, String> _f$status = Field(
    'status',
    _$status,
  );
  static DateTime _$createdAt(MonthlyBudgetDto v) => v.createdAt;
  static const Field<MonthlyBudgetDto, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
  );
  static DateTime _$updatedAt(MonthlyBudgetDto v) => v.updatedAt;
  static const Field<MonthlyBudgetDto, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
  );
  static int _$user(MonthlyBudgetDto v) => v.user;
  static const Field<MonthlyBudgetDto, int> _f$user = Field('user', _$user);
  static int _$month(MonthlyBudgetDto v) => v.month;
  static const Field<MonthlyBudgetDto, int> _f$month = Field('month', _$month);
  static int _$year(MonthlyBudgetDto v) => v.year;
  static const Field<MonthlyBudgetDto, int> _f$year = Field('year', _$year);
  static double _$budgetAmount(MonthlyBudgetDto v) => v.budgetAmount;
  static const Field<MonthlyBudgetDto, double> _f$budgetAmount = Field(
    'budgetAmount',
    _$budgetAmount,
    key: r'budget_amount',
  );
  static int? _$createdBy(MonthlyBudgetDto v) => v.createdBy;
  static const Field<MonthlyBudgetDto, int> _f$createdBy = Field(
    'createdBy',
    _$createdBy,
    key: r'created_by',
    opt: true,
  );
  static int? _$updatedBy(MonthlyBudgetDto v) => v.updatedBy;
  static const Field<MonthlyBudgetDto, int> _f$updatedBy = Field(
    'updatedBy',
    _$updatedBy,
    key: r'updated_by',
    opt: true,
  );

  @override
  final MappableFields<MonthlyBudgetDto> fields = const {
    #id: _f$id,
    #status: _f$status,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #user: _f$user,
    #month: _f$month,
    #year: _f$year,
    #budgetAmount: _f$budgetAmount,
    #createdBy: _f$createdBy,
    #updatedBy: _f$updatedBy,
  };

  static MonthlyBudgetDto _instantiate(DecodingData data) {
    return MonthlyBudgetDto(
      id: data.dec(_f$id),
      status: data.dec(_f$status),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      user: data.dec(_f$user),
      month: data.dec(_f$month),
      year: data.dec(_f$year),
      budgetAmount: data.dec(_f$budgetAmount),
      createdBy: data.dec(_f$createdBy),
      updatedBy: data.dec(_f$updatedBy),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MonthlyBudgetDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MonthlyBudgetDto>(map);
  }

  static MonthlyBudgetDto fromJson(String json) {
    return ensureInitialized().decodeJson<MonthlyBudgetDto>(json);
  }
}

mixin MonthlyBudgetDtoMappable {
  String toJson() {
    return MonthlyBudgetDtoMapper.ensureInitialized()
        .encodeJson<MonthlyBudgetDto>(this as MonthlyBudgetDto);
  }

  Map<String, dynamic> toMap() {
    return MonthlyBudgetDtoMapper.ensureInitialized()
        .encodeMap<MonthlyBudgetDto>(this as MonthlyBudgetDto);
  }

  MonthlyBudgetDtoCopyWith<MonthlyBudgetDto, MonthlyBudgetDto, MonthlyBudgetDto>
  get copyWith =>
      _MonthlyBudgetDtoCopyWithImpl<MonthlyBudgetDto, MonthlyBudgetDto>(
        this as MonthlyBudgetDto,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MonthlyBudgetDtoMapper.ensureInitialized().stringifyValue(
      this as MonthlyBudgetDto,
    );
  }

  @override
  bool operator ==(Object other) {
    return MonthlyBudgetDtoMapper.ensureInitialized().equalsValue(
      this as MonthlyBudgetDto,
      other,
    );
  }

  @override
  int get hashCode {
    return MonthlyBudgetDtoMapper.ensureInitialized().hashValue(
      this as MonthlyBudgetDto,
    );
  }
}

extension MonthlyBudgetDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MonthlyBudgetDto, $Out> {
  MonthlyBudgetDtoCopyWith<$R, MonthlyBudgetDto, $Out>
  get $asMonthlyBudgetDto =>
      $base.as((v, t, t2) => _MonthlyBudgetDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MonthlyBudgetDtoCopyWith<$R, $In extends MonthlyBudgetDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? id,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? user,
    int? month,
    int? year,
    double? budgetAmount,
    int? createdBy,
    int? updatedBy,
  });
  MonthlyBudgetDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _MonthlyBudgetDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MonthlyBudgetDto, $Out>
    implements MonthlyBudgetDtoCopyWith<$R, MonthlyBudgetDto, $Out> {
  _MonthlyBudgetDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MonthlyBudgetDto> $mapper =
      MonthlyBudgetDtoMapper.ensureInitialized();
  @override
  $R call({
    int? id,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? user,
    int? month,
    int? year,
    double? budgetAmount,
    Object? createdBy = $none,
    Object? updatedBy = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (status != null) #status: status,
      if (createdAt != null) #createdAt: createdAt,
      if (updatedAt != null) #updatedAt: updatedAt,
      if (user != null) #user: user,
      if (month != null) #month: month,
      if (year != null) #year: year,
      if (budgetAmount != null) #budgetAmount: budgetAmount,
      if (createdBy != $none) #createdBy: createdBy,
      if (updatedBy != $none) #updatedBy: updatedBy,
    }),
  );
  @override
  MonthlyBudgetDto $make(CopyWithData data) => MonthlyBudgetDto(
    id: data.get(#id, or: $value.id),
    status: data.get(#status, or: $value.status),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    user: data.get(#user, or: $value.user),
    month: data.get(#month, or: $value.month),
    year: data.get(#year, or: $value.year),
    budgetAmount: data.get(#budgetAmount, or: $value.budgetAmount),
    createdBy: data.get(#createdBy, or: $value.createdBy),
    updatedBy: data.get(#updatedBy, or: $value.updatedBy),
  );

  @override
  MonthlyBudgetDtoCopyWith<$R2, MonthlyBudgetDto, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _MonthlyBudgetDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

