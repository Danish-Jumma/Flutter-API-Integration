import 'package:flutter/material.dart';
import 'package:weather_app/Controller/homeController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Api Integratoin'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: ApiData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          leading: Text(snapshot.data[index]['name']),
                          subtitle: Text(
                            snapshot.data[index]['address']['street'],
                          ),
                          trailing: Text(snapshot.data[index]['phone']),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
