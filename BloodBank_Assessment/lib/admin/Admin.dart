class Admin {
  int? Donor_ID;
  String? Donor_Name;
  String? Blood_Group;
  int? Age;
  int? Contact_no;
  String? Address;
  String? Email_ID;
  // String? Hospital_Name;
  // int? Quantity;
  // int? Bags;
  // String? Purpose;

  AdminMap() {
    var myAdmin = Map<String, dynamic>();
    myAdmin["Donor_ID"] = Donor_ID;
    myAdmin["Donor_Name"] = Donor_Name;
    myAdmin["Blood_Group"] = Blood_Group;
    myAdmin["Age"] = Age;
    myAdmin["Contact_no"] = Contact_no;
    myAdmin["Address"] = Address;
    myAdmin["Email_ID"] = Email_ID;
    // myAdmin["Hospital_Name"] = Hospital_Name;
    // myAdmin["Quantity"] = Quantity;
    // myAdmin["Bags"] = Bags;
    // myAdmin["Purpose"] = Purpose;

    return myAdmin;
  }
}
