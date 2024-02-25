import 'package:bigi/bigi_app.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> connectToDatabase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://vqrckbskbfrrvbeyyapj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZxcmNrYnNrYmZycnZiZXl5YXBqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDU1MTU2MjYsImV4cCI6MjAyMTA5MTYyNn0.E5do_NW-QK9RMsJLNyonSX-l1J4LywtYnlbYz1RkXrM',
  );
}

void main() {
  connectToDatabase();
  runApp(const BigiApp());
}
