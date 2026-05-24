import '../database.dart';

class MatriculaTable extends SupabaseTable<MatriculaRow> {
  @override
  String get tableName => 'matricula';

  @override
  MatriculaRow createRow(Map<String, dynamic> data) => MatriculaRow(data);
}

class MatriculaRow extends SupabaseDataRow {
  MatriculaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MatriculaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get alumnoId => getField<int>('alumno_id')!;
  set alumnoId(int value) => setField<int>('alumno_id', value);

  int get carreraId => getField<int>('carrera_id')!;
  set carreraId(int value) => setField<int>('carrera_id', value);

  DateTime get fecha => getField<DateTime>('fecha')!;
  set fecha(DateTime value) => setField<DateTime>('fecha', value);
}
