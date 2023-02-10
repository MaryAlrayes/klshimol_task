
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const[
          CircularProgressIndicator(),
           SizedBox(height: 8,),
          Text('جاري التحميل...')
        ],
      ),
    );
  }
}
