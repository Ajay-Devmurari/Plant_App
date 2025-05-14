import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  final SupabaseClient client = Supabase.instance.client;

  Future<void> userDetail(String name, String email, String phone) async {
    final response = await client.from('user_detail').insert({
      'name': name,
      'email': email,
      'phone': phone,
    });

    if (response.error != null) {
      throw response.error;
    }
  }

}
