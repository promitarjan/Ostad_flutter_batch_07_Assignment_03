import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget!,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
        ],
      ),
      home: ResponsiveUI(),
    );
  }
}

class ResponsiveUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Name on the top left
            Text(
              'Promit Dey Sarker',
              style: TextStyle(
                color: Colors.black,
                fontSize:
                    ResponsiveValue(context, defaultValue: 24.0, valueWhen: [
                  const Condition.smallerThan(
                    name: MOBILE,
                    value: 18.0,
                  ),
                  const Condition.largerThan(
                    name: MOBILE,
                    value: 30.0,
                  )
                ]).value,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Expandable buttons on the top right
            Row(
              children: [
                _buildExpandableButton(context, 'Home'),
                const SizedBox(width: 16.0),
                _buildExpandableButton(context, 'About'),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Green bar at the top of the drawer
            Container(
              color: Colors.green,
              height: 150.0,
              width: double.infinity,
              child: const Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Settings option
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle settings tap
              },
            ),
            // Comments option
            ListTile(
              leading: const Icon(Icons.comment),
              title: const Text('Comments'),
              onTap: () {
                // Handle comments tap
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'FLUTTER WEB.\nTHE BASICS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:
                      ResponsiveValue(context, defaultValue: 24.0, valueWhen: [
                    const Condition.smallerThan(
                      name: MOBILE,
                      value: 18.0,
                    ),
                    const Condition.largerThan(
                      name: MOBILE,
                      value: 30.0,
                    )
                  ]).value,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'In this tutorial we will go over the basics of using '
                'Flutter Web for developing responsive websites.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:
                      ResponsiveValue(context, defaultValue: 16.0, valueWhen: [
                    const Condition.smallerThan(
                      name: MOBILE,
                      value: 14.0,
                    ),
                    const Condition.largerThan(
                      name: MOBILE,
                      value: 18.0,
                    )
                  ]).value,
                ),
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ResponsiveValue(context,
                        defaultValue: 16.0,
                        valueWhen: [
                          const Condition.smallerThan(
                            name: MOBILE,
                            value: 14.0,
                          ),
                          const Condition.largerThan(
                            name: MOBILE,
                            value: 18.0,
                          )
                        ]).value,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableButton(BuildContext context, String title) {
    return PopupMenuButton<String>(
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: ResponsiveValue(context, defaultValue: 16.0, valueWhen: [
            const Condition.smallerThan(
              name: MOBILE,
              value: 14.0,
            ),
            const Condition.largerThan(
              name: MOBILE,
              value: 18.0,
            )
          ]).value,
        ),
      ),
      onSelected: (value) {
        // Handle your actions here
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            value: "Option 1",
            child: Text("Option 1"),
          ),
          const PopupMenuItem(
            value: "Option 2",
            child: Text("Option 2"),
          ),
        ];
      },
    );
  }
}
