import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learn_app/features/dashboard/presentation/widgets/two_button.dart';
import 'package:learn_app/shared/pressable_btn.dart';

class MobileDashboard extends StatefulWidget {
  const MobileDashboard({super.key});

  @override
  State<MobileDashboard> createState() => _MobileDashboardState();
}

class _MobileDashboardState extends State<MobileDashboard> {
  @override
  Widget build(BuildContext context) {
    log('Rebuilding');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(5),
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.all(5),
          child: TwoDButton(iconnew: Icons.more_vert_rounded),
        ),
        title: Text(
          'Srinivas',
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
            shadows: [BoxShadow(color: Colors.black, offset: Offset(1.5, 1.5))],
          ),
        ),
        actions: [
          PressableButton(
            title: 'Resume',
            width: MediaQuery.sizeOf(context) / 2,
          ),
        ],
      ),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
