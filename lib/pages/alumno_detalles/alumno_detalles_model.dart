import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'alumno_detalles_widget.dart' show AlumnoDetallesWidget;
import 'package:flutter/material.dart';

class AlumnoDetallesModel extends FlutterFlowModel<AlumnoDetallesWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in AlumnoDetalles widget.
  List<AlumnoAsignaturaRow>? alumnoAsignatura;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<AlumnoAsignaturaRow>? notaMod;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
