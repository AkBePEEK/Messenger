import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CommentSection(),
    );
  }
}

class CommentSection extends StatefulWidget {
  const CommentSection({super.key});

  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea( // Wrap the entire Scaffold with SafeArea
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80), // Increase height to accommodate notch
          child: AppBar(
            backgroundColor: Color(0xFF3b9678),
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: Padding(
              padding: EdgeInsets.only(top: 20), // Add top padding for notch
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the title
                children: [
                  Text(
                    "Comments",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(width: 60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}