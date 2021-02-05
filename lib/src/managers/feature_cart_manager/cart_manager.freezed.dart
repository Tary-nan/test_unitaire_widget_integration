// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'cart_manager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ItemStateTearOff {
  const _$ItemStateTearOff();

// ignore: unused_element
  Data call(int id, String name, [int price = 42]) {
    return Data(
      id,
      name,
      price,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ItemState = _$ItemStateTearOff();

/// @nodoc
mixin _$ItemState {
  int get id;
  String get name;
  int get price;

  @JsonKey(ignore: true)
  $ItemStateCopyWith<ItemState> get copyWith;
}

/// @nodoc
abstract class $ItemStateCopyWith<$Res> {
  factory $ItemStateCopyWith(ItemState value, $Res Function(ItemState) then) =
      _$ItemStateCopyWithImpl<$Res>;
  $Res call({int id, String name, int price});
}

/// @nodoc
class _$ItemStateCopyWithImpl<$Res> implements $ItemStateCopyWith<$Res> {
  _$ItemStateCopyWithImpl(this._value, this._then);

  final ItemState _value;
  // ignore: unused_field
  final $Res Function(ItemState) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object price = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      price: price == freezed ? _value.price : price as int,
    ));
  }
}

/// @nodoc
abstract class $DataCopyWith<$Res> implements $ItemStateCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, int price});
}

/// @nodoc
class _$DataCopyWithImpl<$Res> extends _$ItemStateCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(Data _value, $Res Function(Data) _then)
      : super(_value, (v) => _then(v as Data));

  @override
  Data get _value => super._value as Data;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object price = freezed,
  }) {
    return _then(Data(
      id == freezed ? _value.id : id as int,
      name == freezed ? _value.name : name as String,
      price == freezed ? _value.price : price as int,
    ));
  }
}

/// @nodoc
class _$Data implements Data {
  const _$Data(this.id, this.name, [this.price = 42])
      : assert(id != null),
        assert(name != null),
        assert(price != null);

  @override
  final int id;
  @override
  final String name;
  @JsonKey(defaultValue: 42)
  @override
  final int price;

  @override
  String toString() {
    return 'ItemState(id: $id, name: $name, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Data &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(price);

  @JsonKey(ignore: true)
  @override
  $DataCopyWith<Data> get copyWith =>
      _$DataCopyWithImpl<Data>(this, _$identity);
}

abstract class Data implements ItemState {
  const factory Data(int id, String name, [int price]) = _$Data;

  @override
  int get id;
  @override
  String get name;
  @override
  int get price;
  @override
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith;
}
