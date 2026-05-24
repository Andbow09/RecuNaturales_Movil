import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';

int calcularEdad(DateTime fechaNacimiento) {
  DateTime hoy = DateTime.now();
  int edad = 0;

  if (fechaNacimiento.isBefore(hoy)) {
    edad = hoy.year - fechaNacimiento.year;

    if (hoy.month < fechaNacimiento.month ||
        (hoy.month == fechaNacimiento.month && hoy.day < fechaNacimiento.day)) {
      edad--;
    }
  }

  return edad;
}

double modificarNota(String nota) {
  double nuevaNota = double.tryParse(nota.replaceAll(',', '.')) ?? 0.0;

  if (nuevaNota > 10 || nuevaNota < 0) {
    return 0.0;
  }

  return nuevaNota;
}
