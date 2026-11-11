import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learn_app/features/dashboard/presentation/widgets/two_button.dart';

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
        actions: [TwoDButton(iconnew: Icons.search_rounded)],
      ),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
