import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final hintText;
  final suffix;
  final TextEditingController controller;
  const TextFields({super.key, @required this.hintText, this.suffix, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: LinearGradient(colors: [
            Color(0xff339003),
            Color(0xff4F78DA),
          ])),
      child: Padding(
        padding: const EdgeInsets.all(0.7),
        child: TextFormField(
          controller: controller,
          style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
          cursorHeight: 23,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).cardColor,
            enabled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(width: 0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(width: 0)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 19,
            ),
            suffixIcon: suffix,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
      ),
    );
  }
}

// passwords...

class TextFields_Passwords extends StatefulWidget {
  final hintText;
  final TextEditingController controller;

  const TextFields_Passwords({
    super.key,
    @required this.hintText, required this.controller,
  });

  @override
  State<TextFields_Passwords> createState() => _TextFields_PasswordsState();
}

class _TextFields_PasswordsState extends State<TextFields_Passwords> {
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  bool? _passwordVisible;


  _TextFields_PasswordsState();
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: LinearGradient(colors: [
            Color(0xff339003),
            Color(0xff4F78DA),
          ])),
      child: Padding(
        padding: const EdgeInsets.all(0.7),
        child: TextFormField(
          controller: widget.controller,
          obscureText: !_passwordVisible!,
          style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
          obscuringCharacter: '*',
          cursorHeight: 23,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).cardColor,
            enabled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(width: 0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(width: 0)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 19,
            ),
            border: InputBorder.none,
            hintText: widget.hintText,
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible! ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xffB8B8B8),
                size: 23,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible!;
                });
              },
            ),
            hintStyle: TextStyle(
              fontSize: 16,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
      ),
    );
  }
}
