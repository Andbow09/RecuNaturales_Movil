import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profesor_widget.dart' show ProfesorWidget;
import 'package:flutter/material.dart';

class ProfesorModel extends FlutterFlowModel<ProfesorWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Profesor widget.
  List<ProfesorRow>? profesor;
  // Stores action output result for [Backend Call - Query Rows] action in Profesor widget.
  List<AsignaturaRow>? asignaturas;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
