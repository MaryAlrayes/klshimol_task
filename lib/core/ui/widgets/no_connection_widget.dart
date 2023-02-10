import 'package:flutter/material.dart';

class NoConnectionWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const NoConnectionWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'لا يوجد اتصال بالانترنت!',
            style: TextStyle(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'من فضلك، تأكد من اتصال الانترنت وحاول مرة أخرى',
              style: TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          OutlinedButton(
            onPressed: onPressed,
            child: const Text(
              'حاول مرة أخرى',
            ),
          )
        ],
      ),
    );
  }
}
