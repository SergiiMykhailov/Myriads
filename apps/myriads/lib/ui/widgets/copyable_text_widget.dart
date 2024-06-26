import 'package:myriads/ui/theme/app_theme.dart';
import 'package:myriads/utils/widget_extensions.dart';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CopyableTextWidget extends StatefulWidget {

  // Public methods and properties

  final String title;
  final String text;

  const CopyableTextWidget({
    required this.title,
    required this.text,
    Key? key
  }) : super(key: key);

  // Overridden methods

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _CopyableWidgetState(title: title, text: text);

}

class _CopyableWidgetState extends State<CopyableTextWidget> {

  // Public methods and properties

  _CopyableWidgetState({
    required String title,
    required String text
  })
    : _title = title
    , _text = text;

  // Overridden methods

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _title,
                style: const TextStyle(
                  color: AppTheme.textColorBody,
                  fontSize: 16
                )
              ),
              Expanded(child: Container()),
              Text(
                _isContentCopied ? 'Copied' : 'Copy all',
                style: const TextStyle(
                  color: AppTheme.textColorBody,
                  fontSize: 16,
                )
              ),
              CupertinoButton(
                child: const Icon(
                  Icons.copy_all,
                  color: AppTheme.textColorBody,
                ),
                onPressed: () {
                  _copyContentToClipboard();
                }
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, bottom: 24),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.secondaryBackgroundColor,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: CupertinoTextField(
              controller: TextEditingController(text: _text),
              readOnly: true,
              minLines: 1,
              maxLines: 100000,
              decoration: const BoxDecoration(
                color: null
              ),
              style: const TextStyle(
                color: AppTheme.textColorBody,
                fontSize: 12,
                height: 2
              ),
            ),
          )
        )
      ],
    );
  }

  // Internal methods

  void _copyContentToClipboard() {
    Clipboard.setData(ClipboardData(text: _text));

    updateState(() {
      _isContentCopied = true;
    });
  }

  // Internal fields

  final String _title;
  final String _text;
  bool _isContentCopied = false;

}