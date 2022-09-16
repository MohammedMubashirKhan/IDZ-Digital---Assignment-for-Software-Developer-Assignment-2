import 'dart:convert';

import 'package:assignment_2/screens/employee_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Future getDataFromAPI() async {
    // var response =
    //     await http.get(Uri.http("aamras.com", "/dummy/EmployeeDetails.json"));
    var response = await http
        .get(Uri.parse("http://aamras.com/dummy/EmployeeDetails.json"));

    Map jsonData = jsonDecode(response.body);
    return jsonData["employees"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EmployeeDummy"),
      ),
      body: Center(
        child: FutureBuilder(
          future: getDataFromAPI(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              TextStyle style = const TextStyle(
                fontSize: 20.0,
                color: Colors.grey,
              );
              return ListView.builder(
                itemCount: (snapshot.data as List).length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EmployeeDetail(
                            name: (snapshot.data as List)[index]["name"],
                            age: (snapshot.data as List)[index]["age"],
                            salary: (snapshot.data as List)[index]["salary"]),
                      ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                (snapshot.data as List)[index]["name"],
                                style: style,
                              ),
                              Text(
                                (snapshot.data as List)[index]["age"]
                                    .toString(),
                                style: style,
                              ),
                              Text(
                                (snapshot.data as List)[index]["salary"]
                                    .toString(),
                                style: style,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                            ],
                          ),
                        ),
                        index == (snapshot.data as List).length - 1
                            ? Container()
                            : const Divider(
                                height: 2,
                                color: Colors.grey,
                              ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
