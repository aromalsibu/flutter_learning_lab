import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

enum ActionType { inc, dec }

final counterProvider = StateProvider<int>((ref) => 0);

final isIncreProvider = StateProvider<bool>((ref) => true);
final isDarkMode = StateProvider<bool>((ref) => true);
