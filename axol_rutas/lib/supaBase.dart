import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

const String supabaseURL = 'https://fwxcwrgczapfadugjmfb.supabase.co';
const String token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ3eGN3cmdjemFwZmFkdWdqbWZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzYxNDYzNzQsImV4cCI6MTk5MTcyMjM3NH0.InQYFRQ9gFi3Zcs81FwSi6fdMK6j2kMx08xsflffG8o';

class SupaAuth {
  final client = SupabaseClient(supabaseURL, token);

  Future singUpUser(context, {String? email, String? password}) async {
    final AuthResponse result =
        await client.auth.signUp(email: email!, password: password!);
    final Session? session = result.session;
    final User? user = result.user;
  }

  Future<User> singInUser(context, {String? email, String? password}) async {
    final AuthResponse result = await client.auth
        .signInWithPassword(email: email!, password: password!);
    final Session? session = result.session;
    final User? user = result.user;

    return user!;
  }

  Future singOutUser(context) async {
    await client.auth.signOut();
  }
}

/*class SupaDataBase {
  final supabase = SupabaseClient(supabaseURL, token);

  Future getData() async {
    final data =
        await supabase.from('sales').select<List<Map<String, dynamic>>>();
  }
}*/
