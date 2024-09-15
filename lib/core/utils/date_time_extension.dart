import 'package:intl/intl.dart';

class DateTimeUtils {
  static DateTime fromUnixEpoch(int unixTimestamp) {
    return DateTime.fromMillisecondsSinceEpoch(unixTimestamp);
  }

  static DateTime fromUnixEpochSeconds(int unixTimestamp) {
    return DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
  }

  static String formatDateTime(DateTime dateTime) {
    return "${dateTime.year.toString().padLeft(4, '0')}-"
        "${dateTime.month.toString().padLeft(2, '0')}-"
        "${dateTime.day.toString().padLeft(2, '0')} "
        "${dateTime.hour.toString().padLeft(2, '0')}:"
        "${dateTime.minute.toString().padLeft(2, '0')}:"
        "${dateTime.second.toString().padLeft(2, '0')}";
  }

  static String formatFromUnixEpoch(int unixTimestamp) {
    DateTime dateTime = fromUnixEpoch(unixTimestamp);
    return formatDateTime(dateTime);
  }

  static String formatFromUnixEpochSeconds(int unixTimestamp) {
    DateTime dateTime = fromUnixEpochSeconds(unixTimestamp);
    return formatDateTime(dateTime);
  }

  static String timeAgo(int unixTimestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);

    DateTime now = DateTime.now();

    Duration difference = now.difference(date);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      int weeks = (difference.inDays / 7).floor();
      return '$weeks weeks ago';
    } else if (difference.inDays < 365) {
      int months = (difference.inDays / 30).floor();
      return '$months months ago';
    } else {
      int years = (difference.inDays / 365).floor();
      return '$years years ago';
    }
  }

  static String memberDuration(int unixTimestamp) {
    // Convert the Unix timestamp (in seconds) to DateTime
    DateTime joinDate =
        DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);

    // Get the current time
    DateTime now = DateTime.now();

    // Calculate the difference in duration
    Duration difference = now.difference(joinDate);

    if (difference.inDays < 1) {
      return 'Member for less than a day';
    } else if (difference.inDays < 7) {
      return 'Member for ${difference.inDays} days';
    } else if (difference.inDays < 30) {
      int weeks = (difference.inDays / 7).floor();
      return 'Member for $weeks weeks';
    } else if (difference.inDays < 365) {
      int months = (difference.inDays / 30).floor();
      return 'Member for $months months';
    } else {
      int years = (difference.inDays / 365).floor();
      return 'Member for $years years';
    }
  }

  static String formatDateWithSuffix(DateTime date) {
    // Format the month and day
    String formattedDate = DateFormat('MMMM d').format(date);

    // Get the day to add the correct suffix
    int day = date.day;
    String suffix = getDaySuffix(day);

    return '$formattedDate$suffix'; // Combine month, day, and suffix
  }

  static String getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th'; // Special case for 11th, 12th, 13th
    }

    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
