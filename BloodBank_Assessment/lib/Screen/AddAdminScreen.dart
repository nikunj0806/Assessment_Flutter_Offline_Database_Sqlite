import 'package:flutter/material.dart';
import 'package:practicdatabase/Screen/AddDoner.dart';
import 'package:practicdatabase/Screen/BloodRequest.dart';
import 'package:practicdatabase/Screen/Search.dart';
import 'package:unicons/unicons.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAdminScreen extends StatefulWidget {
  const MyAdminScreen({super.key});

  @override
  State<MyAdminScreen> createState() => _MyAdminScreenState();
}

class _MyAdminScreenState extends State<MyAdminScreen> {
  List<int> contectList = [120];

  Future<void> taptocall(String? number) async {
    print(number);
    Uri phoneCall = Uri(scheme: 'tel', path: number);
    await launchUrl(phoneCall);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 40,
              ),
              Icon(
                Icons.bloodtype,
                color: Colors.red,
              ),
              Text("Blood Hub"),
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.edit))
        ],
      )),
      drawer: Drawer(
        backgroundColor: Colors.blue.shade300,
        child: Column(
          children: [
            Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Blood Bank",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "Shikha@gmail.com",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(color: Colors.blue.shade600),
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Contacts"),
              leading: Icon(Icons.contacts),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Profile"),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            "assect/images/hospital_pic.png",
            height: 250,
          ),
          SizedBox(
            width: 350,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 5, 2, 111)),
                onPressed: () {
                  int index = 0;
                  taptocall("${contectList[index]}");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.phone_android_rounded,
                      color: Colors.white,
                    ),
                    Text(
                      "TAP TO CALL",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.airport_shuttle,
                      color: Colors.white,
                    ),
                  ],
                )),
          ),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddDonerScreen(),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 150,
                      width: 200,
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_add,
                            size: 120,
                          ),
                          Text(
                            "Add Doner",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MySearchDonerScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 150,
                      width: 200,
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            size: 120,
                          ),
                          Text(
                            "Search Donor",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyBloodReqestScreen(),));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 150,
                      width: 200,
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            UniconsLine.file_question,
                            size: 120,
                          ),
                          Text(
                            "Blood Request",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 150,
                      width: 200,
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home_work_outlined,
                            size: 120,
                          ),
                          Text(
                            "Blood Bank",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
