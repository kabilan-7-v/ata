import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonService {
  static bool isTodayOrFuture(String timestamp) {
    final now = DateTime.now();
    final inputDate = DateTime.parse(timestamp);

    // Get only the date part for comparison
    final nowDate = DateTime(now.year, now.month, now.day);
    final inputDateOnly =
        DateTime(inputDate.year, inputDate.month, inputDate.day);

    // Check if the input date is today or in the future
    if (inputDateOnly.isAfter(nowDate)) {
      return true;
    }
    // if (inputDateOnly.isAtSameMomentAs(nowDate)){
    //   return true;
    // }
    else {
      return false;
    }
  }

  static String formateddate(timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);

    String formattedDate = DateFormat('MMM dd').format(dateTime);
    return formattedDate;
    // Output: Dec 31
  }

  static String formatToCustomDate(String isoDate) {
    DateTime dateTime = DateTime.parse(isoDate);
    String dayWithSuffix = '${dateTime.day}th'; // Always adds "th"
    String month = DateFormat('MMMM').format(dateTime);
    return '$dayWithSuffix $month';
  }

  static String formatdateForEvents(String date) {
    DateTime dateTime = DateTime.parse(date);
    String res = DateFormat('dd MMMM yyyy').format(dateTime);
    return res;
  }

  static String taketime(String date) {
    String res = date.split("T")[1].substring(0, 5);
    List<String> parts = res.split(':');
    int hours = int.parse(parts[0]);
    int minutes =
        parts.length > 1 ? int.parse(parts[1]) : 0; // Optional minutes

    // Create a DateTime object (assuming today's date)
    DateTime dateTime = DateTime(2024, 1, 1, hours, minutes);

    // Determine if it's AM or PM
    return res + (dateTime.hour < 12 ? ' AM' : ' PM');
  }

  static String getAmOrPm(String timeInput) {
    // Parse the time
    List<String> parts = timeInput.split('.');
    int hours = int.parse(parts[0]);
    int minutes =
        parts.length > 1 ? int.parse(parts[1]) : 0; // Optional minutes

    // Create a DateTime object (assuming today's date)
    DateTime dateTime = DateTime(2024, 1, 1, hours, minutes);

    // Determine if it's AM or PM
    return dateTime.hour < 12 ? 'AM' : 'PM';
  }

  static pickImage() async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('profileimgeurl', pickedFile.path);
    }
  }

  static imageretreive() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('profileimgeurl');
  }

  static Future<void> launchurl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  static track_ticket_date_format(String text) {
    String utcTime = text;

    // Parse the UTC time string to DateTime
    DateTime utcDateTime = DateTime.parse(utcTime);

    // Convert UTC to IST (UTC+5:30)
    DateTime istDateTime = utcDateTime.add(Duration(hours: 5, minutes: 30));

    // Format IST DateTime to 12-hour format with AM/PM
    String formattedIST = DateFormat('hh:mm:ss a').format(istDateTime);
    return formattedIST;
  }
}
