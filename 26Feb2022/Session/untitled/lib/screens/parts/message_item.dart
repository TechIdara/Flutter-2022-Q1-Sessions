import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Fri 08 Jan 2022"),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: Colors.blue),
            ),
            child: Text(
                "Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022"),
          )
        ],
      ),
    );
  }
}
