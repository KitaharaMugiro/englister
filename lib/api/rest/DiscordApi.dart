import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class DiscordApi {
  static Future<void> sendError(String msg) async {
    final url =
        Uri.https('discord.com', '/api/channels/1014516625615097867/messages');
    await http.post(url,
        headers: {'Authorization': 'Bot ${dotenv.env['BOT_TOKEN']}'},
        body: {'content': msg});
  }
}
