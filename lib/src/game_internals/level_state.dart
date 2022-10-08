// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';

/// An extremely silly example of a game state.
///
/// Tracks only a single variable, [progress], and calls [onLose] when
/// the value of [progress] reaches [goal].
class LevelState extends ChangeNotifier {
  final VoidCallback onLose;


  LevelState({required this.onLose});

  int _progress = 0;

  int get progress => _progress;

  void setProgress(int value) {
    _progress = value;
    notifyListeners();
  }

  void evaluate(bool lost) {
    if (lost) {
      onLose();
    }
  }
}
