import '/flutter_flow/flutter_flow_util.dart';
import 'asignatura_flippable_widget.dart' show AsignaturaFlippableWidget;
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

class AsignaturaFlippableModel
    extends FlutterFlowModel<AsignaturaFlippableWidget> {
  ///  Local state fields for this component.

  double offSet = 0.0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for FlippableCard widget.
  final flippableCardController = FlipCardController();
  bool flippableCardIsFront = true;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
