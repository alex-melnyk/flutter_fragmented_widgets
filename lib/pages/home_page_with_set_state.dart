import 'dart:async';

import 'package:flutter/material.dart';

class HomePageWithSetState extends StatefulWidget {
  const HomePageWithSetState({Key? key}) : super(key: key);

  @override
  _HomePageWithSetStateState createState() => _HomePageWithSetStateState();
}

class _HomePageWithSetStateState extends State<HomePageWithSetState> {
  bool _requesting = false;

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
                      setState(() {
                        _requesting = true;
                      });

                      Timer(Duration(seconds: 1), () {
                        setState(() {
                          _requesting = false;
                        });
                      });
                    },
                    child: _requesting
                        ? SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: theme.colorScheme.onPrimary,
                            ),
                          )
                        : Text('REQUEST'),
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
