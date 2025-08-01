// Mocks generated by Mockito 5.4.6 from annotations
// in takehomechalange/test/home_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:takehomechalange/domain/entities/character_entity.dart' as _i2;
import 'package:takehomechalange/domain/repositories/character_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCharacterEntity_0 extends _i1.SmartFake
    implements _i2.CharacterEntity {
  _FakeCharacterEntity_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [CharacterRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCharacterRepository extends _i1.Mock
    implements _i3.CharacterRepository {
  MockCharacterRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i2.CharacterEntity>> getCharacters(int? page) =>
      (super.noSuchMethod(
            Invocation.method(#getCharacters, [page]),
            returnValue: _i4.Future<List<_i2.CharacterEntity>>.value(
              <_i2.CharacterEntity>[],
            ),
          )
          as _i4.Future<List<_i2.CharacterEntity>>);

  @override
  _i4.Future<_i2.CharacterEntity> getCharacterDetail(int? id) =>
      (super.noSuchMethod(
            Invocation.method(#getCharacterDetail, [id]),
            returnValue: _i4.Future<_i2.CharacterEntity>.value(
              _FakeCharacterEntity_0(
                this,
                Invocation.method(#getCharacterDetail, [id]),
              ),
            ),
          )
          as _i4.Future<_i2.CharacterEntity>);

  @override
  _i4.Future<List<_i2.CharacterEntity>> searchCharacters(String? query) =>
      (super.noSuchMethod(
            Invocation.method(#searchCharacters, [query]),
            returnValue: _i4.Future<List<_i2.CharacterEntity>>.value(
              <_i2.CharacterEntity>[],
            ),
          )
          as _i4.Future<List<_i2.CharacterEntity>>);

  @override
  _i4.Future<void> addFavorite(_i2.CharacterEntity? character) =>
      (super.noSuchMethod(
            Invocation.method(#addFavorite, [character]),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);

  @override
  _i4.Future<void> removeFavorite(int? id) =>
      (super.noSuchMethod(
            Invocation.method(#removeFavorite, [id]),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);

  @override
  _i4.Future<List<_i2.CharacterEntity>> getFavorites() =>
      (super.noSuchMethod(
            Invocation.method(#getFavorites, []),
            returnValue: _i4.Future<List<_i2.CharacterEntity>>.value(
              <_i2.CharacterEntity>[],
            ),
          )
          as _i4.Future<List<_i2.CharacterEntity>>);
}
