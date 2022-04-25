import 'package:flutter/material.dart';

class EmpsDetail extends StatefulWidget {
  const EmpsDetail({Key? key, required this.empName, required this.email})
      : super(key: key);
  final String empName;
  final String email;


  @override
  State<EmpsDetail> createState() => _EmpsDetailState();
}

class _EmpsDetailState extends State<EmpsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.empName),
        centerTitle: true,
      ),
      body: Text('emp email is：${widget.email}'),
    );
  }

}
