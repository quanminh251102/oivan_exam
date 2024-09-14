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
    DateTime dateTime = fromUnixEpoch(unixTimestamp);
    Duration diff = DateTime.now().difference(dateTime);

    if (diff.inSeconds < 60) {
      return '${diff.inSeconds} ${diff.inSeconds == 1 ? 'second' : 'seconds'} ago';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes} ${diff.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} ${diff.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (diff.inDays < 7) {
      return '${diff.inDays} ${diff.inDays == 1 ? 'day' : 'days'} ago';
    } else if (diff.inDays < 30) {
      int weeks = (diff.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else if (diff.inDays < 365) {
      int months = (diff.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else {
      int years = (diff.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    }
  }

  static String memberDuration(int unixTimestamp) {
    DateTime startDate = fromUnixEpoch(unixTimestamp);
    DateTime currentDate = DateTime.now();

    int years = currentDate.year - startDate.year;
    int months = currentDate.month - startDate.month;
    int days = currentDate.day - startDate.day;

    if (months < 0) {
      years -= 1;
      months += 12;
    }

    if (days < 0) {
      months -= 1;

      days += DateTime(currentDate.year, currentDate.month, 0).day;
    }

    if (months < 0) {
      months += 12;
      years -= 1;
    }

    String yearStr = years > 0 ? '$years ${years == 1 ? 'year' : 'years'}' : '';
    String monthStr =
        months > 0 ? '$months ${months == 1 ? 'month' : 'months'}' : '';
    String dayStr = days > 0 ? '$days ${days == 1 ? 'day' : 'days'}' : '';

    List<String> components = [yearStr, monthStr, dayStr]
        .where((element) => element.isNotEmpty)
        .toList();
    return components.isNotEmpty
        ? 'Member for ${components.join(', ')}'
        : 'Member for less than a day';
  }
}
