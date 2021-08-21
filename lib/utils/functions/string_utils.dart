import 'dart:core';

extension StringExtension on String {
  List<int> indicesOf(String char) {
    List<int> indices = [];
    for (int i = 0; i < this.length; i++) {
      int hold = this.indexOf(char, i);
      if (hold != -1 && !indices.contains(hold)) {
        indices.add(hold);
      }
    }
    return indices;
  }

  String get png => "assets/images/${this}.png";
  String get svg => "assets/svgs/${this}.svg";
}

String svgPath(String name) => name.svg;
String pngPath(String name) => name.png;


bool isValidPassword(String it) =>
    RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})")
        .hasMatch(it);

bool isValidEmailAddress(String it) =>
    RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(it);

final String PATTERN_VISA = r"^4[0-9]{12}(?:[0-9]{3})?$";
final String PATTERN_MASTERCARD =
    r"^(?:5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12}$";
final String PATTERN_AMERICAN_EXPRESS = r"^3[47][0-9]{13}$";
final String PATTERN_DINERS_CLUB = r"^3(?:0[0-5]|[68][0-9])[0-9]{11}$";
final String PATTERN_DISCOVER = r"^6(?:011|5[0-9]{2})[0-9]{12}$";
final String PATTERN_JCB = r"^(?:2131|1800|35[0-9]{3})[0-9]{11}$";
final String PATTERN_VERVE = r"^((506(0|1))|(507(8|9))|(6500))[0-9]{12,15}$";

String getCardTypeImagePath({String type}) {
  if (type == ("VISA")) {
    return "assets/images/visalogo.png";
  } else if (type == ("MASTERCARD")) {
    return "assets/images/mastercardlogo.png";
  } else if (type == ("VERVE")) {
    return "assets/images/vervelogo.png";
  } else if (type == ("AMERICANEXPRESS")) {
    return "assets/images/americanexpresslogo.png";
  } else if (type == ("DINNERSCLUB")) {
    return "assets/images/dinnersclublogo.png";
  }
  return "";
}

String zeroPrefixNumber(int number) => number < 10 ? "0$number" : "$number";

bool isPasswordCompliant(String password, [int minLength = 8]) {
  if (password == null || password.isEmpty) {
    return false;
  }

  bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
  bool hasDigits = password.contains(new RegExp(r'[0-9]'));
  bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
  bool hasSpecialCharacters =
      password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool hasMinLength = password.length >= minLength;

  return hasDigits &
      hasUppercase &
      hasLowercase &
      hasSpecialCharacters &
      hasMinLength;
}

String defaultValidator(
    {String value, String fieldName, String Function(String) otherValidator}) {
  if (value.trim().isEmpty) {
    return "$fieldName is required";
  }
  if (otherValidator != null) {
    return otherValidator(value);
  }
  return null;
}

String numberSuffixWord(int number, String word) {
  if (word.toLowerCase().endsWith('y')) {
    return "$number ${number > 1 ? word.substring(0, word.length - 1) + "ies" : word}";
  }
  return "$number ${number > 1 ? word + "s" : word}";
}

String printDuration(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}

List<String> mySearch({List<String> possibleResults, String query}) {
  query = query.toLowerCase();
  List<String> splitQuery = query.split(" ");
  List<String> results = [];
  possibleResults.forEach((statement) {
    List<bool> workedFor = [];
    for (var word in splitQuery) {
      if (statement.contains(word) || word.contains(statement)) {
        workedFor.add(true);
      } else {
        List<int> charIndexAtWord = [];
        List<int> charIndexAtStatement = [];
        for (int i = 0; i < word.length; i++) {
          String smallStatement = statement.toLowerCase();
          List<int> hold = (smallStatement.indicesOf(word[i]));
          hold.forEach((element) {
            if (element != -1) {
              charIndexAtWord.add(i);
              charIndexAtStatement.add(element);
            }
          });
        }
        bool met = false;
        for (int i = 0; i < charIndexAtWord.length; i++) {
          int numberMetForSequence = 0;
          if (charIndexAtStatement[i] != -1) {
            for (int j = charIndexAtStatement[i];
                j < statement.length;
                j++, charIndexAtWord[i]++) {
              if (charIndexAtWord[i] <= word.length - 1) {
                if (statement[j].toLowerCase() ==
                    word[charIndexAtWord[i]].toLowerCase()) {
                  numberMetForSequence++;
                }
              } else {
                break;
              }
            }
          }

          if ((word.length < 3 && numberMetForSequence == word.length) ||
              numberMetForSequence >= (word.length ~/ 2) + 2) {
            met = true;
            break;
          }
        }
        workedFor.add(met);
      }
    }
    if (workedFor.contains(true)) {
      results.add(statement);
    }
  });
  return results;
}

String capitalize(String it) => it.isEmpty
    ? it
    : it[0].toUpperCase() + it.substring(1, it.length).toLowerCase();

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String formatAmount(double it) => it.toStringAsFixed(2).replaceAllMapped(
    new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
