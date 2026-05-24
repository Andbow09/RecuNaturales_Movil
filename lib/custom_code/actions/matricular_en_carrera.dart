// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future matricularEnCarrera(
  int alumnoId,
  int carreraId,
) async {
  final supabase = Supabase.instance.client;

  await supabase.from('matricula').insert({
    'alumno_id': alumnoId,
    'carrera_id': carreraId,
    'fecha': DateTime.now(),
  });

  final asignaturas = await supabase
      .from('asignatura')
      .select('id')
      .eq('carrera_id', carreraId)
      .eq('año', 1);

  for (final asign in asignaturas) {
    await supabase.from('alumno_asignatura').insert({
      'alumno_id': alumnoId,
      'asignatura_id': asign['id'],
      'nota': null,
      'aprobada': false,
    });
  }
  // Add your function code here!
}
