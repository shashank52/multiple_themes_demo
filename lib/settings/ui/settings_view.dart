import 'package:flutter/material.dart';
import 'package:multiple_themes_demo/widgets/app_floating_button.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Center(
              child: Text(
            'Select Color',
            style: Theme.of(context).textTheme.bodyLarge,
          )),
          Row(
            children: const [
              Expanded(
                  child: InkWell(
                    onTap: ,
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Red'),
                )),
              )),
              Expanded(
                  child: InkWell(
                    child: Center(
                        child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Blue'),
                                )),
                  ))
            ],
          )
        ]),
      ),
      floatingActionButton: const AppFloatingButton(),
    );
  }
}
