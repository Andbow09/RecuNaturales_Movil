import '../database.dart';

class AsignaturaTable extends SupabaseTable<AsignaturaRow> {
  @override
  String get tableName => 'asignatura';

  @override
  AsignaturaRow createRow(Map<String, dynamic> data) => AsignaturaRow(data);
}

class AsignaturaRow extends SupabaseDataRow {
  AsignaturaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AsignaturaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);

  String get descripcion => getField<String>('descripcion')!;
  set descripcion(String value) => setField<String>('descripcion', value);

  int? get creditos => getField<int>('creditos');
  set creditos(int? value) => setField<int>('creditos', value);

  int get anio => getField<int>('anio')!;
  set anio(int value) => setField<int>('anio', value);

  int get carreraId => getField<int>('carrera_id')!;
  set carreraId(int value) => setField<int>('carrera_id', value);

  int? get profesorId => getField<int>('profesor_id');
  set profesorId(int? value) => setField<int>('profesor_id', value);
}
