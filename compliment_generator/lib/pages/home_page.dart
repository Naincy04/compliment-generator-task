import 'dart:convert';

import 'package:compliment_generator/pages/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "Press button to get compliment";
  getData() async {
    const String ur =
        "https://8768zwfurd.execute-api.us-east-1.amazonaws.com/v1/compliments";
    var response = await http.get(Uri.parse(ur));
    data = jsonDecode(response.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
        title: const Text(
          "Compliment Generator app",
          style: TextStyle(fontSize: 19),
        ),
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_image2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(80),
                child: Text(
                  data,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      getData();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF7373)),
                    child: const Text("Get Compliment"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF7373)),
                      onPressed: () {
                        Share.share(data);
                      },
                      icon: const Icon(Icons.share_outlined),
                      label: const Text("Share")),
                ],
              ),
            ],
          ),
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
