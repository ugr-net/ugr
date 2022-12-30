import 'package:flutter/material.dart';
import 'package:ugrr/colors.dart';

class SearchAndBtn extends StatelessWidget {
  const SearchAndBtn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Flex(direction: Axis.vertical, children: [
        TextField(
          autofillHints: ['jio', 'job', 'place'],
          cursorColor: accentColor,
          enableSuggestions: true,
          onTap: () => null,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: accentColor,
              ),
            ),
            focusColor: accentColor,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            constraints: BoxConstraints(
              maxWidth: 280,
            ),
            hintText: "Search for something",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () => null,
            child: Text(
              'Advanced Search',
              style: TextStyle(
                color: accentColor,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
