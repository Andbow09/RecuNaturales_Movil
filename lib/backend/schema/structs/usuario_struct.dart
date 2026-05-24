// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsuarioStruct extends BaseStruct {
  UsuarioStruct({
    int? id,
    String? nombre,
    String? apellidos,
    String? email,
    String? contrasena,
    DateTime? fechaNacimiento,
    String? rol,
  })  : _id = id,
        _nombre = nombre,
        _apellidos = apellidos,
        _email = email,
        _contrasena = contrasena,
        _fechaNacimiento = fechaNacimiento,
        _rol = rol;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "apellidos" field.
  String? _apellidos;
  String get apellidos => _apellidos ?? '';
  set apellidos(String? val) => _apellidos = val;

  bool hasApellidos() => _apellidos != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "contrasena" field.
  String? _contrasena;
  String get contrasena => _contrasena ?? '';
  set contrasena(String? val) => _contrasena = val;

  bool hasContrasena() => _contrasena != null;

  // "fecha_nacimiento" field.
  DateTime? _fechaNacimiento;
  DateTime? get fechaNacimiento => _fechaNacimiento;
  set fechaNacimiento(DateTime? val) => _fechaNacimiento = val;

  bool hasFechaNacimiento() => _fechaNacimiento != null;

  // "rol" field.
  String? _rol;
  String get rol => _rol ?? '';
  set rol(String? val) => _rol = val;

  bool hasRol() => _rol != null;

  static UsuarioStruct fromMap(Map<String, dynamic> data) => UsuarioStruct(
        id: castToType<int>(data['id']),
        nombre: data['nombre'] as String?,
        apellidos: data['apellidos'] as String?,
        email: data['email'] as String?,
        contrasena: data['contrasena'] as String?,
        fechaNacimiento: data['fecha_nacimiento'] as DateTime?,
        rol: data['rol'] as String?,
      );

  static UsuarioStruct? maybeFromMap(dynamic data) =>
      data is Map ? UsuarioStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nombre': _nombre,
        'apellidos': _apellidos,
        'email': _email,
        'contrasena': _contrasena,
        'fecha_nacimiento': _fechaNacimiento,
        'rol': _rol,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'apellidos': serializeParam(
          _apellidos,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'contrasena': serializeParam(
          _contrasena,
          ParamType.String,
        ),
        'fecha_nacimiento': serializeParam(
          _fechaNacimiento,
          ParamType.DateTime,
        ),
        'rol': serializeParam(
          _rol,
          ParamType.String,
        ),
      }.withoutNulls;

  static UsuarioStruct fromSerializableMap(Map<String, dynamic> data) =>
      UsuarioStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        apellidos: deserializeParam(
          data['apellidos'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        contrasena: deserializeParam(
          data['contrasena'],
          ParamType.String,
          false,
        ),
        fechaNacimiento: deserializeParam(
          data['fecha_nacimiento'],
          ParamType.DateTime,
          false,
        ),
        rol: deserializeParam(
          data['rol'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UsuarioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UsuarioStruct &&
        id == other.id &&
        nombre == other.nombre &&
        apellidos == other.apellidos &&
        email == other.email &&
        contrasena == other.contrasena &&
        fechaNacimiento == other.fechaNacimiento &&
        rol == other.rol;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, nombre, apellidos, email, contrasena, fechaNacimiento, rol]);
}

UsuarioStruct createUsuarioStruct({
  int? id,
  String? nombre,
  String? apellidos,
  String? email,
  String? contrasena,
  DateTime? fechaNacimiento,
  String? rol,
}) =>
    UsuarioStruct(
      id: id,
      nombre: nombre,
      apellidos: apellidos,
      email: email,
      contrasena: contrasena,
      fechaNacimiento: fechaNacimiento,
      rol: rol,
    );
