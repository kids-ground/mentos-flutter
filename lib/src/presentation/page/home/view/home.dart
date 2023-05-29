import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/util/color/color_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(42),
        child: AppBar(
          backgroundColor: ColorStyles.white,
          leading: Container(
            margin: const EdgeInsets.fromLTRB(24, 0, 0, 0),
            child: Image.asset(
              "assets/images/mentos.png",
              height: 12,
              width: 12,
            ),
          ),
          elevation: 0,
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text("a"), Text("b"), Text("c")
            ],
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) => Text('${index} 굿굿')
            ),
          )

        ],
      )
    );
  }
}
