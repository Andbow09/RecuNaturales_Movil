import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'asignatura_flippable_model.dart';
export 'asignatura_flippable_model.dart';

class AsignaturaFlippableWidget extends StatefulWidget {
  const AsignaturaFlippableWidget({
    super.key,
    required this.carrera,
  });

  final CarreraRow? carrera;

  @override
  State<AsignaturaFlippableWidget> createState() =>
      _AsignaturaFlippableWidgetState();
}

class _AsignaturaFlippableWidgetState extends State<AsignaturaFlippableWidget>
    with TickerProviderStateMixin {
  late AsignaturaFlippableModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AsignaturaFlippableModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: null,
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: null,
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlipCard(
      fill: Fill.fillBack,
      controller: _model.flippableCardController,
      onFlip: () => _model.flippableCardIsFront = !_model.flippableCardIsFront,
      direction: FlipDirection.HORIZONTAL,
      speed: 400,
      front: GestureDetector(
        onHorizontalDragEnd: (details) async {
          if (_model.offSet > 100.0) {
            var confirmDialogResponse = await showDialog<bool>(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      title: Text('Matriculación'),
                      content: Text('¿Quieres matricularte en esta carrera?'),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, false),
                          child: Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, true),
                          child: Text('Confirmar'),
                        ),
                      ],
                    );
                  },
                ) ??
                false;
            if (confirmDialogResponse) {
              await actions.matricularEnCarrera(
                FFAppState().usuarioActual.id,
                widget.carrera!.id,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Te has matriculado correctamente',
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                ),
              );

              context.pushNamed(AlumnoWidget.routeName);
            } else {
              if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
                await animationsMap['containerOnActionTriggerAnimation1']!
                    .controller
                    .forward(from: 0.0)
                    .whenComplete(
                        animationsMap['containerOnActionTriggerAnimation1']!
                            .controller
                            .reverse);
              }
            }
          } else {
            if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
              await animationsMap['containerOnActionTriggerAnimation1']!
                  .controller
                  .forward(from: 0.0)
                  .whenComplete(
                      animationsMap['containerOnActionTriggerAnimation1']!
                          .controller
                          .reverse);
            }
          }

          _model.offSet = 0.0;
          safeSetState(() {});
        },
        onHorizontalDragUpdate: (details) async {
          _model.offSet = _model.offSet + details.delta.dx;
          safeSetState(() {});
          if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
            await animationsMap['containerOnActionTriggerAnimation1']!
                .controller
                .forward(from: 0.0);
          }
        },
        child: Container(
          width: double.infinity,
          height: 150.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.carrera?.nombre,
                    'Nombre',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ],
            ),
          ),
        ),
      ).animateOnActionTrigger(
        animationsMap['containerOnActionTriggerAnimation1']!,
        effects: [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 0.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(
                valueOrDefault<double>(
                  _model.offSet,
                  0.0,
                ),
                0.0),
          ),
        ],
      ),
      back: GestureDetector(
        onHorizontalDragEnd: (details) async {
          if (_model.offSet > 100.0) {
            var confirmDialogResponse = await showDialog<bool>(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      title: Text('Matriculación'),
                      content: Text('¿Quieres matricularte en esta carrera?'),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, false),
                          child: Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, true),
                          child: Text('Confirmar'),
                        ),
                      ],
                    );
                  },
                ) ??
                false;
            if (confirmDialogResponse) {
              await actions.matricularEnCarrera(
                FFAppState().usuarioActual.id,
                widget.carrera!.id,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Te has matriculado correctamente',
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                ),
              );

              context.pushNamed(AlumnoWidget.routeName);
            } else {
              if (animationsMap['containerOnActionTriggerAnimation2'] != null) {
                await animationsMap['containerOnActionTriggerAnimation2']!
                    .controller
                    .forward(from: 0.0)
                    .whenComplete(
                        animationsMap['containerOnActionTriggerAnimation2']!
                            .controller
                            .reverse);
              }
            }
          } else {
            if (animationsMap['containerOnActionTriggerAnimation2'] != null) {
              await animationsMap['containerOnActionTriggerAnimation2']!
                  .controller
                  .forward(from: 0.0)
                  .whenComplete(
                      animationsMap['containerOnActionTriggerAnimation2']!
                          .controller
                          .reverse);
            }
          }

          _model.offSet = 0.0;
          safeSetState(() {});
        },
        onHorizontalDragUpdate: (details) async {
          _model.offSet = _model.offSet + details.delta.dx;
          safeSetState(() {});
          if (animationsMap['containerOnActionTriggerAnimation2'] != null) {
            await animationsMap['containerOnActionTriggerAnimation2']!
                .controller
                .forward(from: 0.0);
          }
        },
        child: Container(
          width: double.infinity,
          height: 150.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.carrera?.descripcion,
                    'Descripción',
                  ),
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ],
            ),
          ),
        ),
      ).animateOnActionTrigger(
        animationsMap['containerOnActionTriggerAnimation2']!,
        effects: [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 0.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(
                valueOrDefault<double>(
                  _model.offSet,
                  0.0,
                ),
                0.0),
          ),
        ],
      ),
    );
  }
}
