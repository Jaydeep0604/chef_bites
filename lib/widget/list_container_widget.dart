import 'package:flutter/material.dart';

class ListContainer extends StatefulWidget {
  ListContainer({Key? key, this.listName, this.color, this.textColor})
      : super(key: key);
  String? listName;
  Color? color;
  Color? textColor;

  @override
  State<ListContainer> createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Container(
        decoration: BoxDecoration(
            color: widget.color, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 5,
            bottom: 5,
          ),
          child: Center(
              child: Text(
            "${widget.listName}",
            style: TextStyle(fontSize: 12, color: widget.textColor),
          )),
        ),
      ),
    );
  }
}
