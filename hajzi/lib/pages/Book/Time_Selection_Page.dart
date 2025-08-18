// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hajzi/pages/Book/controls/time_selection_logic.dart';
import 'package:hajzi/pages/Book/widget/time_selection_widgets.dart';
import 'package:provider/provider.dart';

class TimeSelectionPage extends StatelessWidget {
  const TimeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimeSelectionLogic(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Color(0xFFE0F7FA)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                const CustomAppBar(),
                Expanded(
                  child: Consumer<TimeSelectionLogic>(
                    builder: (context, logic, _) =>
                        TimeSelectionBody(logic: logic),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
