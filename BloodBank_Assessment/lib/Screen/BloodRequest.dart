import 'package:flutter/material.dart';
import 'package:practicdatabase/admin/Admin.dart';
import 'package:practicdatabase/admin/AdminService.dart';
import 'package:practicdatabase/request/RequestService.dart';
import 'package:practicdatabase/request/request.dart';

class MyBloodReqestScreen extends StatefulWidget {
  const MyBloodReqestScreen({super.key});

  @override
  State<MyBloodReqestScreen> createState() => _MyBloodReqestScreenState();
}

class _MyBloodReqestScreenState extends State<MyBloodReqestScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  List<String> requeriment = [
    'Whole Blood',
    'Red Blood Cells (RBC)',
    'Platelets',
    'Plasma',
  ];
  List<String> purposes = [
    'Surgery',
    'Accident/Emergency',
    'Cancer Treatment',
    'Anemia',
    'Childbirth (Postpartum Hemorrhage)',
    'Thalassemia',
    'Organ Transplant',
    'Dialysis',
    'Other',
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController otherReasonController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController bagsController = TextEditingController();

  String? gender;
  String? hospital;
  String? selectedBloodGroup;
  String? requerimentBlood;
  String? selectedPurpose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blood Request"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Patient Information
                Text(
                  "1. Patient's Information",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Enter Your Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Enter Your Age",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: contactController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Enter Your Contact",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your contact number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        value: 'Male',
                        title: Text("Male"),
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        value: 'Female',
                        title: Text("Female"),
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "2. Medical Information",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 10),
                Text(
                  "Hospital Name",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                RadioListTile(
                  value: 'K.D',
                  title: Text("K.D Hospital"),
                  groupValue: hospital,
                  onChanged: (value) {
                    setState(() {
                      hospital = value;
                    });
                  },
                ),
                RadioListTile(
                  value: 'Zydus',
                  title: Text("Zydus Hospital"),
                  groupValue: hospital,
                  onChanged: (value) {
                    setState(() {
                      hospital = value;
                    });
                  },
                ),
                RadioListTile(
                  value: 'Sal',
                  title: Text("Sal Hospital"),
                  groupValue: hospital,
                  onChanged: (value) {
                    setState(() {
                      hospital = value;
                    });
                  },
                ),
                RadioListTile(
                  value: 'Civel',
                  title: Text("Civel Hospital"),
                  groupValue: hospital,
                  onChanged: (value) {
                    setState(() {
                      hospital = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                Text(
                  "3. Blood Requirement Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Select Blood Group',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedBloodGroup,
                  onChanged: (value) {
                    setState(() {
                      selectedBloodGroup = value;
                    });
                  },
                  items: bloodGroups.map((bloodGroup) {
                    return DropdownMenuItem(
                      value: bloodGroup,
                      child: Text(bloodGroup),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a blood group';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: quantityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Quantity (e.g., ml)',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the quantity';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: bagsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Number of Bags',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the number of bags';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Select Purpose',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedPurpose,
                  onChanged: (value) {
                    setState(() {
                      selectedPurpose = value;
                      if (value != 'Other') {
                        otherReasonController.clear();
                      }
                    });
                  },
                  items: purposes.map((purpose) {
                    return DropdownMenuItem(
                      value: purpose,
                      child: Text(purpose),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a purpose';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                if (selectedPurpose == 'Other')
                  TextFormField(
                    controller: otherReasonController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Enter Custom Reason',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (selectedPurpose == 'Other' &&
                          (value == null || value.isEmpty)) {
                        return 'Please specify your reason';
                      }
                      return null;
                    },
                  ),
                SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 400,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // var admin = Admin();
                          var request = Request();
                          request.name = nameController.text.toString();
                          request.age =
                              int.parse(ageController.text);
                          request.contact =
                              int.parse(contactController.text);
                          request.blood = selectedBloodGroup;
                          request.hospital = hospital;
                          request.Quantity =
                              int.parse(quantityController.text);
                          request.Bags =
                              int.parse(bagsController.text);
                          request.Purpose = selectedPurpose == 'Other'
                              ? otherReasonController.text
                              : selectedPurpose;

                          // var adminService = Adminservice();
                          var requestService = Requestservice();
                          var result =
                              await requestService.insertService(request);

                          if (result != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      Text('Form submitted successfully!')),
                            );

                            nameController.clear();
                            ageController.clear();
                            contactController.clear();
                            quantityController.clear();
                            bagsController.clear();
                            otherReasonController.clear();

                            setState(() {
                              gender = null;
                              hospital = null;
                              selectedBloodGroup = null;
                              selectedPurpose = null;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Failed to submit the form')),
                            );
                          }
                        }
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyReqestDetails(),
            ));
      }),
    );
  }
}

class MyReqestDetails extends StatefulWidget {
  const MyReqestDetails({super.key});

  @override
  State<MyReqestDetails> createState() => _MyReqestDetailsState();
}

class _MyReqestDetailsState extends State<MyReqestDetails> {
  List<Request> requestList = [];
  // var adminService = Adminservice();
  var requestService = Requestservice();
  var requestModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecordsFromDB();
  }

//   Future<void> getRecordsFromDB() async {
//     requestService = Requestservice();
// var allRequest = await requestService.readService();

//     setState(() {
//       requestList = allRequest.map<Request>((request) {
//         var model = request();
//         model.id = request["id"];
//         model.name = request["name"];
//         model.blood = request["blood"];
//         model.age = request["age"];
//         model.contact = request["contact"];
//         model.address = request["address"];
//         // model.Email_ID = request["Email_ID"];
//         model.hospital = request["hospital"];
//         model.Quantity = request["Quantity"];
//         model.Bags = request["Bags"];
//         model.Purpose = request["Purpose"];
//         return model;
//       }).toList();
//     });
//   }

Future<void> getRecordsFromDB() async {
  var allRequest = await requestService.readService();
  print("Fetched Data: $allRequest");

  if (allRequest != null) {
    setState(() {
      requestList = allRequest.map<Request>((request) {
        var model = Request(); // Correct class initialization
        model.id = request["id"];
        model.name = request["name"];
        model.blood = request["blood"];
        model.age = request["age"];
        model.contact = request["contact"];
        model.hospital = request["hospital"];
        model.Quantity = request["Quantity"];
        model.Bags = request["Bags"];
        model.Purpose = request["Purpose"];
        return model;
      }).toList();
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Emergency Donor"),
        ),
        body: requestList.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: requestList.length,
                itemBuilder: (context, index) {
                  var req = requestList[index];
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text("Name : ${req.name}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Number: ${req.contact}"),
                          Text("Hospital: ${req.hospital}"),
                          Text("Blood Group: ${req.blood}"),
                          Text("Quantity: ${req.Quantity} ml"),
                          Text("Bags: ${req.Bags}"),
                          Text("Purpose: ${req.Purpose}"),
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
