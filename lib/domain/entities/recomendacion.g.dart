// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recomendacion.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecomendacionCollection on Isar {
  IsarCollection<Recomendacion> get recomendacions => this.collection();
}

const RecomendacionSchema = CollectionSchema(
  name: r'Recomendacion',
  id: 4500651749624388786,
  properties: {
    r'costo': PropertySchema(
      id: 0,
      name: r'costo',
      type: IsarType.double,
    ),
    r'descripcion': PropertySchema(
      id: 1,
      name: r'descripcion',
      type: IsarType.string,
    ),
    r'foto': PropertySchema(
      id: 2,
      name: r'foto',
      type: IsarType.string,
    ),
    r'idPlatillo': PropertySchema(
      id: 3,
      name: r'idPlatillo',
      type: IsarType.long,
    ),
    r'ingredientes': PropertySchema(
      id: 4,
      name: r'ingredientes',
      type: IsarType.string,
    ),
    r'necesidad': PropertySchema(
      id: 5,
      name: r'necesidad',
      type: IsarType.string,
    ),
    r'nombre': PropertySchema(
      id: 6,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'platilloDia': PropertySchema(
      id: 7,
      name: r'platilloDia',
      type: IsarType.string,
    )
  },
  estimateSize: _recomendacionEstimateSize,
  serialize: _recomendacionSerialize,
  deserialize: _recomendacionDeserialize,
  deserializeProp: _recomendacionDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _recomendacionGetId,
  getLinks: _recomendacionGetLinks,
  attach: _recomendacionAttach,
  version: '3.1.0+1',
);

int _recomendacionEstimateSize(
  Recomendacion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.descripcion.length * 3;
  bytesCount += 3 + object.foto.length * 3;
  bytesCount += 3 + object.ingredientes.length * 3;
  bytesCount += 3 + object.necesidad.length * 3;
  bytesCount += 3 + object.nombre.length * 3;
  bytesCount += 3 + object.platilloDia.length * 3;
  return bytesCount;
}

void _recomendacionSerialize(
  Recomendacion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.costo);
  writer.writeString(offsets[1], object.descripcion);
  writer.writeString(offsets[2], object.foto);
  writer.writeLong(offsets[3], object.idPlatillo);
  writer.writeString(offsets[4], object.ingredientes);
  writer.writeString(offsets[5], object.necesidad);
  writer.writeString(offsets[6], object.nombre);
  writer.writeString(offsets[7], object.platilloDia);
}

Recomendacion _recomendacionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Recomendacion(
    costo: reader.readDouble(offsets[0]),
    descripcion: reader.readString(offsets[1]),
    foto: reader.readString(offsets[2]),
    idPlatillo: reader.readLong(offsets[3]),
    ingredientes: reader.readString(offsets[4]),
    necesidad: reader.readString(offsets[5]),
    nombre: reader.readString(offsets[6]),
    platilloDia: reader.readString(offsets[7]),
  );
  object.isarId = id;
  return object;
}

P _recomendacionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _recomendacionGetId(Recomendacion object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _recomendacionGetLinks(Recomendacion object) {
  return [];
}

void _recomendacionAttach(
    IsarCollection<dynamic> col, Id id, Recomendacion object) {
  object.isarId = id;
}

extension RecomendacionQueryWhereSort
    on QueryBuilder<Recomendacion, Recomendacion, QWhere> {
  QueryBuilder<Recomendacion, Recomendacion, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RecomendacionQueryWhere
    on QueryBuilder<Recomendacion, Recomendacion, QWhereClause> {
  QueryBuilder<Recomendacion, Recomendacion, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RecomendacionQueryFilter
    on QueryBuilder<Recomendacion, Recomendacion, QFilterCondition> {
  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      costoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'costo',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      costoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'costo',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      costoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'costo',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      costoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'costo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      descripcionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      descripcionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      descripcionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      descripcionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descripcion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      descripcionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      descripcionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      descripcionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      descripcionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descripcion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition> fotoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      fotoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      fotoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition> fotoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      fotoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'foto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      fotoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'foto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      fotoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'foto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition> fotoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'foto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      fotoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foto',
        value: '',
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      fotoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'foto',
        value: '',
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      idPlatilloEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idPlatillo',
        value: value,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      idPlatilloGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idPlatillo',
        value: value,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      idPlatilloLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idPlatillo',
        value: value,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      idPlatilloBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idPlatillo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      ingredientesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ingredientes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      ingredientesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ingredientes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      ingredientesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ingredientes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      ingredientesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ingredientes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      ingredientesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ingredientes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      ingredientesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ingredientes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      ingredientesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ingredientes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      ingredientesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ingredientes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      ingredientesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ingredientes',
        value: '',
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      ingredientesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ingredientes',
        value: '',
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      necesidadEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'necesidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      necesidadGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'necesidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      necesidadLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'necesidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      necesidadBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'necesidad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      necesidadStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'necesidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      necesidadEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'necesidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      necesidadContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'necesidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      necesidadMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'necesidad',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      necesidadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'necesidad',
        value: '',
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      necesidadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'necesidad',
        value: '',
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      nombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      nombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      nombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      nombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      nombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      nombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      nombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      nombreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      platilloDiaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'platilloDia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      platilloDiaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'platilloDia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      platilloDiaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'platilloDia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      platilloDiaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'platilloDia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      platilloDiaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'platilloDia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      platilloDiaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'platilloDia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      platilloDiaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'platilloDia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      platilloDiaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'platilloDia',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      platilloDiaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'platilloDia',
        value: '',
      ));
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterFilterCondition>
      platilloDiaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'platilloDia',
        value: '',
      ));
    });
  }
}

extension RecomendacionQueryObject
    on QueryBuilder<Recomendacion, Recomendacion, QFilterCondition> {}

extension RecomendacionQueryLinks
    on QueryBuilder<Recomendacion, Recomendacion, QFilterCondition> {}

extension RecomendacionQuerySortBy
    on QueryBuilder<Recomendacion, Recomendacion, QSortBy> {
  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> sortByCosto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costo', Sort.asc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> sortByCostoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costo', Sort.desc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> sortByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy>
      sortByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> sortByFoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foto', Sort.asc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> sortByFotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foto', Sort.desc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> sortByIdPlatillo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPlatillo', Sort.asc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy>
      sortByIdPlatilloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPlatillo', Sort.desc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy>
      sortByIngredientes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientes', Sort.asc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy>
      sortByIngredientesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientes', Sort.desc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> sortByNecesidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'necesidad', Sort.asc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy>
      sortByNecesidadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'necesidad', Sort.desc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> sortByPlatilloDia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platilloDia', Sort.asc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy>
      sortByPlatilloDiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platilloDia', Sort.desc);
    });
  }
}

extension RecomendacionQuerySortThenBy
    on QueryBuilder<Recomendacion, Recomendacion, QSortThenBy> {
  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> thenByCosto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costo', Sort.asc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> thenByCostoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costo', Sort.desc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> thenByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy>
      thenByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> thenByFoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foto', Sort.asc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> thenByFotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foto', Sort.desc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> thenByIdPlatillo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPlatillo', Sort.asc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy>
      thenByIdPlatilloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPlatillo', Sort.desc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy>
      thenByIngredientes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientes', Sort.asc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy>
      thenByIngredientesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientes', Sort.desc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> thenByNecesidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'necesidad', Sort.asc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy>
      thenByNecesidadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'necesidad', Sort.desc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy> thenByPlatilloDia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platilloDia', Sort.asc);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QAfterSortBy>
      thenByPlatilloDiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platilloDia', Sort.desc);
    });
  }
}

extension RecomendacionQueryWhereDistinct
    on QueryBuilder<Recomendacion, Recomendacion, QDistinct> {
  QueryBuilder<Recomendacion, Recomendacion, QDistinct> distinctByCosto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'costo');
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QDistinct> distinctByDescripcion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QDistinct> distinctByFoto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foto', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QDistinct> distinctByIdPlatillo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idPlatillo');
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QDistinct> distinctByIngredientes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ingredientes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QDistinct> distinctByNecesidad(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'necesidad', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Recomendacion, Recomendacion, QDistinct> distinctByPlatilloDia(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'platilloDia', caseSensitive: caseSensitive);
    });
  }
}

extension RecomendacionQueryProperty
    on QueryBuilder<Recomendacion, Recomendacion, QQueryProperty> {
  QueryBuilder<Recomendacion, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<Recomendacion, double, QQueryOperations> costoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'costo');
    });
  }

  QueryBuilder<Recomendacion, String, QQueryOperations> descripcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcion');
    });
  }

  QueryBuilder<Recomendacion, String, QQueryOperations> fotoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foto');
    });
  }

  QueryBuilder<Recomendacion, int, QQueryOperations> idPlatilloProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idPlatillo');
    });
  }

  QueryBuilder<Recomendacion, String, QQueryOperations> ingredientesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ingredientes');
    });
  }

  QueryBuilder<Recomendacion, String, QQueryOperations> necesidadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'necesidad');
    });
  }

  QueryBuilder<Recomendacion, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<Recomendacion, String, QQueryOperations> platilloDiaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'platilloDia');
    });
  }
}
