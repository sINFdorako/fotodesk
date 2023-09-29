class FormatFileSize {
  String format(int bytes) {
    if (bytes < 1024) {
      return "$bytes B"; // Bytes
    } else if (bytes < 1024 * 1024) {
      return "${(bytes / 1024).toStringAsFixed(2)} KB"; // Kilobytes
    } else if (bytes < 1024 * 1024 * 1024) {
      return "${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB"; // Megabytes
    } else {
      return "${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB"; // Gigabytes
    }
  }
}
