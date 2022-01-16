import 'package:flutter/material.dart';

class SliderHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      /* width: 64,*/
      height: 20,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          GestureDetector(
            /* onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie), */
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: AssetImage('assets/toyota.png'),
              width: 64,
              height: 64,
              //fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
