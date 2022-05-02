import 'package:flutter/material.dart';
import 'package:piano/piano.dart';
import 'package:tile_teacher/components/escala.dart';

const kPrimaryColor = Color(0xFF889DE8);
const kPrimaryLightColor = Color(0xFFB9D0FD);
const kErrorColor = Color(0xFFE88888);
const kErrorLightColor = Color(0xFFFDB9B9);
const kSuccessColor = Color(0xFFA2E888);
const kSuccessLightColor = Color(0xFFD5FDB9);
const kPrimaryBGColor = Color(0xFF5B8692);
const kPrimaryBGLightColor = Color(0xFFB9F4FD);

enum Status {
  SUCCESS,
  ERROR
}

final Escala INTRO = Escala("INTRODUÇÃO", "https://www.youtube.com/watch?v=ZhRceLvP8Ao", 0, 206, "intro.png",
    "Escalas musicais são sequências ordenadas de notas. Por exemplo: dó, ré, mi, fá, sol, lá, si, dó…repetindo esse ciclo. Nessa escala, começou-se com a nota dó e foi-se seguindo uma sequência bem definida de intervalos até o retorno para a nota dó novamente. Essa sequência de distâncias foi: tom, tom, semitom, tom, tom, tom, semitom…repetindo o ciclo.",
    [
      NotePosition(note: Note.C, accidental: Accidental.None, octave: 4),
      NotePosition(note: Note.D, accidental: Accidental.None, octave: 4),
      NotePosition(note: Note.E, accidental: Accidental.None, octave: 4),
      NotePosition(note: Note.F, accidental: Accidental.None, octave: 4),
      NotePosition(note: Note.G, accidental: Accidental.None, octave: 4),
      NotePosition(note: Note.A, accidental: Accidental.None, octave: 4),
      NotePosition(note: Note.B, accidental: Accidental.None, octave: 4),
      NotePosition(note: Note.C, accidental: Accidental.None, octave: 5)
    ]);

final Escala DO_MAIOR = Escala("DÓ Maior", "https://www.youtube.com/watch?v=cCl6fMz9Trg", 215, 309, "do.gif",
    "A escala de Dó maior é a escala mais fácil de ser identificada no teclado, pois corresponde à todas as teclas brancas. Esta escala é formada pelas notas: C – D – E – F – G – A – B – C (Dó – Ré – Mi – Fá – Sol – Si – Dó).",
    [
  NotePosition(note: Note.C, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.D, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.E, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.F, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.G, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.A, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.B, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.C, accidental: Accidental.None, octave: 5)
]);

final Escala RE_MAIOR = Escala("RÉ Maior", "https://www.youtube.com/watch?v=cCl6fMz9Trg", 318, 334, "re.gif",
    "A escala de Ré é formada pelas notas: D – E – F# – G – A – B – C# – D (Ré – Mi- Fá sustenido – Sol – Lá – Si – Dó sustenido – Ré).",
    [
  NotePosition(note: Note.D, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.E, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.F, accidental: Accidental.Sharp, octave: 4),
  NotePosition(note: Note.G, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.A, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.B, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.C, accidental: Accidental.Sharp, octave: 5),
  NotePosition(note: Note.D, accidental: Accidental.None, octave: 5)
]);

final Escala MI_MAIOR = Escala("MI Maior", "https://www.youtube.com/watch?v=cCl6fMz9Trg", 371, 381, "mi.gif",
    "A escala de Mi é formada pelas notas: E – F# – G# – A – B – C# – D# – E (Mi – Fá sustenido – Sol sustenido – Lá – Si – Dó sustenido/Ré bemol – Ré sustenido/Mi bemol – Mi).",
    [
  NotePosition(note: Note.E, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.F, accidental: Accidental.Sharp, octave: 4),
  NotePosition(note: Note.G, accidental: Accidental.Sharp, octave: 4),
  NotePosition(note: Note.A, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.B, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.C, accidental: Accidental.Sharp, octave: 5),
  NotePosition(note: Note.D, accidental: Accidental.Sharp, octave: 5),
  NotePosition(note: Note.E, accidental: Accidental.None, octave: 5)
]);

final Escala FA_MAIOR = Escala("FÁ Maior", "https://www.youtube.com/watch?v=cCl6fMz9Trg", 411, 500, "fa.gif",
    "A escala de Fá é formada pelas notas: F – G – A – Bb – C – D – E – F (Fá – Sol – Lá – Lá sustenido/Si Bemol – Dó – Ré – Mi – Fá).",
    [
  NotePosition(note: Note.F, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.G, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.A, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.A, accidental: Accidental.Sharp, octave: 4),
  NotePosition(note: Note.C, accidental: Accidental.None, octave: 5),
  NotePosition(note: Note.D, accidental: Accidental.None, octave: 5),
  NotePosition(note: Note.E, accidental: Accidental.None, octave: 5),
  NotePosition(note: Note.F, accidental: Accidental.None, octave: 5)
]);

final Escala SOL_MAIOR = Escala("SOL Maior", "https://www.youtube.com/watch?v=cCl6fMz9Trg", 385, 393, "sol.gif",
    "A escala de Sol é formada pelas notas: G – A – B – C – D – E – F# – G ( Sol, Lá, Sí, Dó, Ré, Mi, Fá sustenido, Sol).",
    [
  NotePosition(note: Note.G, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.A, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.B, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.C, accidental: Accidental.None, octave: 5),
  NotePosition(note: Note.D, accidental: Accidental.None, octave: 5),
  NotePosition(note: Note.E, accidental: Accidental.None, octave: 5),
  NotePosition(note: Note.F, accidental: Accidental.Sharp, octave: 5),
  NotePosition(note: Note.G, accidental: Accidental.None, octave: 5)
]);

final Escala LA_MAIOR = Escala("LÁ Maior", "https://www.youtube.com/watch?v=cCl6fMz9Trg", 393, 400, "la.gif",
    "A escala de Lá é formada pelas notas: A – B – C# – D – E – F# – G# – A (Lá, Si, Dó sustenido, Mi, Fá sustenido, Sol sustenido, Lá).",
    [
  NotePosition(note: Note.A, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.B, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.C, accidental: Accidental.Sharp, octave: 5),
  NotePosition(note: Note.D, accidental: Accidental.None, octave: 5),
  NotePosition(note: Note.E, accidental: Accidental.None, octave: 5),
  NotePosition(note: Note.F, accidental: Accidental.Sharp, octave: 5),
  NotePosition(note: Note.G, accidental: Accidental.Sharp, octave: 5),
  NotePosition(note: Note.A, accidental: Accidental.None, octave: 5)
]);

final Escala SI_MAIOR = Escala("SI Maior", "https://www.youtube.com/watch?v=cCl6fMz9Trg", 400, 408, "si.gif",
    "A escala de Si é formada pelas notas: B – C# – D# – E – F# – G# – A# – B (Si, Dó sustenido, Ré sustenido, Mi, Fá sustenido, Sol sustenido, Lá sustenido, Si).",
    [
  NotePosition(note: Note.B, accidental: Accidental.None, octave: 4),
  NotePosition(note: Note.C, accidental: Accidental.Sharp, octave: 5),
  NotePosition(note: Note.D, accidental: Accidental.Sharp, octave: 5),
  NotePosition(note: Note.E, accidental: Accidental.None, octave: 5),
  NotePosition(note: Note.F, accidental: Accidental.Sharp, octave: 5),
  NotePosition(note: Note.G, accidental: Accidental.Sharp, octave: 5),
  NotePosition(note: Note.A, accidental: Accidental.Sharp, octave: 5),
  NotePosition(note: Note.B, accidental: Accidental.None, octave: 5),
]);
