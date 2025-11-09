class AppLogger {
  static void d(Object? o) { assert(() { print('🟦 $o'); return true; }()); }
  static void e(Object? o) { assert(() { print('🟥 $o'); return true; }()); }
}
