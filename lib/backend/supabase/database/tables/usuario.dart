import '../database.dart';

class UsuarioTable extends SupabaseTable<UsuarioRow> {
  @override
  String get tableName => 'usuario';

  @override
  UsuarioRow createRow(Map<String, dynamic> data) => UsuarioRow(data);
}

class UsuarioRow extends SupabaseDataRow {
  UsuarioRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuarioTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);

  String get apellidos => getField<String>('apellidos')!;
  set apellidos(String value) => setField<String>('apellidos', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String get contrasena => getField<String>('contrasena')!;
  set contrasena(String value) => setField<String>('contrasena', value);

  DateTime get fechaNacimiento => getField<DateTime>('fecha_nacimiento')!;
  set fechaNacimiento(DateTime value) =>
      setField<DateTime>('fecha_nacimiento', value);

  String get rol => getField<String>('rol')!;
  set rol(String value) => setField<String>('rol', value);
}
