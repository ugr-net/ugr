import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class InfoList extends StatelessWidget {
  final List<List> items;

  const InfoList({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  // Icon(Icons.abc),
                  Text("Title"),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Text("Text jdfejb fdhvbjcbruer "),
            )
          ],
        ),
      ],
    );
  }
}
