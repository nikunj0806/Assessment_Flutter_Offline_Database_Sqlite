import 'package:flutter/material.dart';
import 'package:practicdatabase/admin/Admin.dart';
import 'package:practicdatabase/admin/AdminService.dart';

class MySearchDonerScreen extends StatefulWidget {
  const MySearchDonerScreen({
    super.key,
  });

  @override
  State<MySearchDonerScreen> createState() => _MySearchDonerScreenState();
}

class _MySearchDonerScreenState extends State<MySearchDonerScreen> {
  List<Admin> adminList = [];
  List<Admin> filterUsers = [];
  var adminService = Adminservice();
  var adminModel;
  TextEditingController searchController = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecords();
  }

  getRecords() async {
    adminService = Adminservice();

    var allAdmin = await adminService.readService();
    allAdmin.forEach((admin) {
      adminModel = Admin();

      setState(() {
        adminModel.Donor_ID = admin["Donor_ID"];
        adminModel.Donor_Name = admin["Donor_Name"];
        adminModel.Blood_Group = admin["Blood_Group"];
        adminModel.Age = admin["Age"];
        adminModel.Contact_no = admin["Contact_no"];
        adminModel.Address = admin["Address"];
        adminModel.Email_ID = admin["Email_ID"];

        adminList.add(adminModel);
        isLoading = false;
      });
    });
  }

  void searchData(String keyword) {
    setState(() {
      filterUsers = adminList
          .where(
            (element) =>
                element.Blood_Group.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ||
                element.Donor_Name.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Doner"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) => searchData(value),
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    // onChanged: searchData,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: searchController.text.isEmpty
                        ? adminList.length
                        : filterUsers.length,
                    itemBuilder: (context, index) {
                      var data = searchController.text.isEmpty
                          ? adminList[index]
                          : filterUsers[index];

                      return Card(
                        child: ListTile(
                          leading: Text("${data.Blood_Group}"),
                          title: Text("${data.Donor_Name}"),
                          subtitle: Text("${data.Contact_no}"),
                          trailing: Wrap(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MyUpdateScreen(adminedit: data),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.edit),
                              ),
                              SizedBox(width: 25),
                              IconButton(
                                onPressed: () async {
                                  print("Delete button clicked");
                                  print(data.Donor_ID);

                                  var result =
                                      await adminService.deletService(data);
                                  print(result);

                                  Navigator.pop(context);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MySearchDonerScreen(),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.delete, color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

class MyUpdateScreen extends StatefulWidget {
  Admin adminedit;
  MyUpdateScreen({super.key, required this.adminedit});

  @override
  State<MyUpdateScreen> createState() => _MyUpdateScreenState();
}

class _MyUpdateScreenState extends State<MyUpdateScreen> {
  TextEditingController nameColtroller = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController bloodController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      nameColtroller.text = widget.adminedit.Donor_Name!;
      bloodController.text = widget.adminedit.Blood_Group!;
      contactController.text = widget.adminedit.Contact_no.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: (){}, icon: icon),
        title: Text("Uploade Admin"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: nameColtroller,
                decoration: InputDecoration(
                    hintText: "Enter Name",
                    labelText: "NAME",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: bloodController,
                decoration: InputDecoration(
                    hintText: "Enter Blood Group",
                    labelText: "BLOOD GROUP",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: contactController,
                decoration: InputDecoration(
                    hintText: "Enter Contect",
                    labelText: "CONTECT",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  String? name = nameColtroller.text.toString();
                  String? blood = bloodController.text.toString();
                  int? contact = int.parse(contactController.text.toString());

                  print(name);

                  var admin = Admin();
                  admin.Donor_ID = widget.adminedit.Donor_ID;
                  admin.Donor_Name = name;
                  admin.Blood_Group = blood;
                  admin.Contact_no = contact;

                  var adminService = Adminservice();

                  var result = await adminService.updateService(admin);

                  print("result = $result");

                  nameColtroller.clear();
                  bloodController.clear();
                  contactController.clear();
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MySearchDonerScreen(),
                      ));
                },
                child: Text("UPDATE"))
          ],
        ),
      ),
    );
  }
}
