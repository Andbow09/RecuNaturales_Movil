import '../database.dart';

class ProfesorTable extends SupabaseTable<ProfesorRow> {
  @override
  String get tableName => 'profesor';

  @override
  ProfesorRow createRow(Map<String, dynamic> data) => ProfesorRow(data);
}

class ProfesorRow extends SupabaseDataRow {
  ProfesorRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfesorTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get usuarioId => getField<int>('usuario_id')!;
  set usuarioId(int value) => setField<int>('usuario_id', value);

  int? get departamentoId => getField<int>('departamento_id');
  set departamentoId(int? value) => setField<int>('departamento_id', value);
}
