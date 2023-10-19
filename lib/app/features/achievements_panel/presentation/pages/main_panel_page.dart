import 'package:flutter/material.dart';

import '../components/adjustments_panel_component.dart';

class MainPanelPage extends StatelessWidget {
  const MainPanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    const count = 3;
    const space = 16.0;
    const size = 50.0;

    final List<int> grid = [1, 2, 3];
    final List<Widget> gridWidgets = List<Widget>.from(
      grid.map(
        (e) => Container(
          width: size,
          height: size,
          color: Colors.blueGrey,
          child: Center(
            child: Text(e.toString()),
          ),
        ),
      ),
    );

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: space,
              runSpacing: space,
              children: gridWidgets,
            ),
          ),
          const Expanded(
            child: AdjustmentsPanelComponent(),
          ),
        ],
      ),
    );
  }
}
