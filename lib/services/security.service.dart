import 'package:http/http.dart' as http;
import 'package:outalma/utils/outalma.config.dart';

class SecurityService {
  Future<void> loginService(String login, String password) async {
    Map<String, String> body = {'login': login, 'password': password};
    final url = Uri.parse('$apiKey/login');
    final response = await http.post(url,
        headers: {
          'X-API-Key': apiKey,
        },
        body: body);
    // Traitez la réponse de l'API ici
    // ignore: avoid_print
    print(response);
  }
}
