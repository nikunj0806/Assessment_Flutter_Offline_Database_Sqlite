import 'package:flutter/material.dart';
import 'package:practicdatabase/admin/Admin.dart';
import 'package:practicdatabase/admin/AdminService.dart';
import 'package:practicdatabase/Screen/Search.dart';

class AddDonerScreen extends StatefulWidget {
  const AddDonerScreen({super.key});

  @override
  State<AddDonerScreen> createState() => _AddDonerScreenState();
}

class _AddDonerScreenState extends State<AddDonerScreen> {
  // TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController bloodController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController contectController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Doner Entery"),
      ),
      body: Column(
        children: [
          // SizedBox(height: 15,),
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: TextField(
          //     controller: idController,
          //     decoration: InputDecoration(
          //         hintText: "Enter ID",
          //         labelText: "ID",
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(20),
          //         )),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: nameController,
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
              controller: ageController,
              decoration: InputDecoration(
                  hintText: "Enter Age",
                  labelText: "AGE",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: contectController,
              decoration: InputDecoration(
                  hintText: "Enter Contect",
                  labelText: "CONTECT",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                  hintText: "Enter Address",
                  labelText: "Address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () async {
                    // var id = int.parse(idController.text.toString());
                    var name = nameController.text.toString();
                    var blood = bloodController.text.toString();
                    var age = int.parse(ageController.text.toString());
                    var contect = int.parse(contectController.text.toString());
                    var address = addressController.text.toString();

                    var admin = Admin();
                    admin.Donor_Name = name;
                    admin.Blood_Group = blood;
                    admin.Age = age;
                    admin.Contact_no = contect;
                    admin.Address = address;

                    var adminService = Adminservice();

                    var result = await adminService.insertService(admin);

                    print("Result = $result");
                    
                   
                        // idController.clear();
                        nameController.clear();
                        bloodController.clear();
                        ageController.clear();
                        contectController.clear();
                        addressController.clear();

                        //  Navigator.push(
                        // context,
                        // MaterialPageRoute(
                        //   builder: (context) => MySearchDonerScreen(
                        //     // name: nameController.text.toString(),
                        //     // bloodGroup: bloodController.text.toString(),
                        //     // contactNumber: contectController.text.toString(),
                        //     // address: addressController.text.toString(),
                        //   ),
                        // ));
                  },
                  child: Text(
                    "Add Donor Button",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  )))
        ],
      ),
    );
  }
}
