import 'package:flutter/material.dart';

class MentorListPage extends StatelessWidget {
  const MentorListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("멘토 리스트"),
      ),
    );
  }
}
