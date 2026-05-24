import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'asignatura_detalle_profesor_widget.dart'
    show AsignaturaDetalleProfesorWidget;
import 'package:flutter/material.dart';

class AsignaturaDetalleProfesorModel
    extends FlutterFlowModel<AsignaturaDetalleProfesorWidget> {
  ///  Local state fields for this page.

  double offSet = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in AsignaturaDetalleProfesor widget.
  List<AlumnoAsignaturaRow>? alumnosRelation;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
