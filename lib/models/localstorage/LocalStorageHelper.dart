import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class LocalStorageHelper {
  static saveStudySessionId(String studySessionId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("StudySessionId", studySessionId);
  }

  static Future<String?> getStudySessionId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("StudySessionId");
  }

  static clearStudySessionId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("StudySessionId");
  }

  static initializeUserId() async {
    var uuid = const Uuid();
    var userId = await getUserId() ?? uuid.v4();
    final prefs = await SharedPreferences.getInstance();
    print('aaaa');
    print(userId);
    await prefs.setString("UserId", userId);
  }

  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("UserId");
  }

  static clearUserId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("UserId");
  }

  static savePreviousStudiedCategorySlug(String categorySlug) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("PrevCategorySlug", categorySlug);
  }

  static getPreviousStudiedCategorySlug() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("PrevCategorySlug");
  }
}
