import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';

class SnackbarService {
  showSnackBar(String content, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: orange,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            const Icon(Icons.info_outline, size: 20),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                content,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
            ),
          ],
        ),
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }
}
