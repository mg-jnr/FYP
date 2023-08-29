import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

///
class FilePickerUtil {
  ///
  static final FilePicker _filePicker = FilePicker.platform;

  ///
  static Future<FilePickerResult?> pickFiles() async {
    try {
      return await _filePicker.pickFiles();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      rethrow;
    }
  }
}
