import 'package:flutter/material.dart';

import '../image_file.dart';

class FileView extends StatelessWidget {
  final ImageFile file;

  const FileView({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}
