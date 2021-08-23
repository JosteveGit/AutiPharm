import 'package:auti_pharm/core/constants.dart';
import 'package:auti_pharm/core/models/user/user_details.dart';

class QuestionService {
  static Future<void> pushResult({
    Child child,
    String score,
    int level,
    String time,
  }) async {
    await database
        .reference()
        .child("Users")
        .child(userDetails.uid)
        .child("Details")
        .child("children")
        .child(child.id)
        .child("history")
        .push()
        .set(
      {
        "difficulty": child.levelOfUnderstanding,
        "level": level,
        "score": score,
        "time": time,
      },
    );
  }
}
