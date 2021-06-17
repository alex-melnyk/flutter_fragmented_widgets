import 'dart:async';

import 'package:flutter/material.dart';

class HomePageWithValueNotifier extends StatefulWidget {
  const HomePageWithValueNotifier({Key? key}) : super(key: key);

  @override
  _HomePageWithValueNotifierState createState() => _HomePageWithValueNotifierState();
}

class _HomePageWithValueNotifierState extends State<HomePageWithValueNotifier> {
  final _requesting = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.red,
                      child: SizedBox(
                        height: 200,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      color: Colors.green,
                      child: SizedBox(
                        height: 200,
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                color: Colors.blue,
                child: SizedBox(
                  width: double.maxFinite,
                  height: 200,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.purple,
                      child: SizedBox(
                        height: 200,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      color: Colors.deepOrangeAccent,
                      child: SizedBox(
                        height: 200,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _requesting.value = true;

                      Timer(Duration(seconds: 1), () {
                        _requesting.value = false;
                      });
                    },
                    child: ValueListenableBuilder<bool>(
                      valueListenable: _requesting,
                      builder: (context, value, child) {
                        return value
                            ? SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: theme.colorScheme.onPrimary,
                                ),
                              )
                            : Text('REQUEST');
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
