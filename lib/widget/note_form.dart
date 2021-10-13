import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final bool? isFinished;
  final String? content;
  final ValueChanged<bool> onChangedFinished;
  final ValueChanged<String> onChangedcontent;

  const NoteFormWidget({
    Key? key,
    this.isFinished = false,
    this.content = '',
    required this.onChangedFinished,
    required this.onChangedcontent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
              const SizedBox(height: 30),
              Container(
                width: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blueGrey.shade100,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not done',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    Switch(
                      value: isFinished ?? false,
                      onChanged: onChangedFinished,
                      activeColor: Colors.amberAccent,
                      activeTrackColor: Colors.blueAccent,
                      inactiveThumbColor: Colors.amberAccent,
                    ),
                    const Text(
                      'Done',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 3,
        initialValue: content,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 22,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Type your note',
          hintStyle: const TextStyle(color: Colors.black87),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueAccent, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueAccent, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        validator: (content) => content != null && content.isEmpty
            ? 'The Note cannot be empty'
            : null,
        onChanged: onChangedcontent,
      );
}
