import 'package:flutter/material.dart';
import 'data.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  Future response = fetchData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: FutureBuilder(
              future: response,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) => Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      color: const Color(0xff39A2DB),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("ID : ${snapshot.data[index]["id"]}",
                                style: Theme.of(context).textTheme.headline2),
                            Text("Name : ${snapshot.data[index]["name"]}",
                                style: Theme.of(context).textTheme.headline2),
                            Text(
                                "Username : ${snapshot.data[index]["username"]}",
                                style: Theme.of(context).textTheme.headline2),
                            Text("Email : ${snapshot.data[index]["email"]}",
                                style: Theme.of(context).textTheme.headline2),
                            const SizedBox(height: 10.0),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: ExpansionTile(
                                title: const Text(
                                  'Address',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                children: [
                                  Text(
                                      "Street : ${snapshot.data[index]["address"]["street"]}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2),
                                  Text(
                                      "Suite : ${snapshot.data[index]["address"]["suite"]}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2),
                                  Text(
                                    "City : ${snapshot.data[index]["address"]["city"]}",
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  Text(
                                      "Zip code : ${snapshot.data[index]["address"]["zipcode"]}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2),
                                  Text(
                                      "LAT : ${snapshot.data[index]["address"]["geo"]["lat"]}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2),
                                  Text(
                                      "LNG : ${snapshot.data[index]["address"]["geo"]["lng"]}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Text("Phone : ${snapshot.data[index]["phone"]}",
                                style: Theme.of(context).textTheme.headline2),
                            Text("Website : ${snapshot.data[index]["website"]}",
                                style: Theme.of(context).textTheme.headline2),
                            const SizedBox(height: 10.0),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: ExpansionTile(
                                title: const Text(
                                  'Company',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                children: [
                                  Text(
                                      "Name : ${snapshot.data[index]["company"]["name"]}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2),
                                  Text(
                                      "Catch Phrase : ${snapshot.data[index]["company"]["catchPhrase"]}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2),
                                  Text(
                                      "BS : ${snapshot.data[index]["company"]["bs"]}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }
}
