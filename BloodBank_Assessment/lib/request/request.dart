class Request {
  int? id;
  String? name;
  String? blood;
  int? age;
  int? contact;
  String? address;
  String? hospital;
  int? Quantity;
  int? Bags;
  String? Purpose;

  RequestMap() {
    var myRequest = Map<String, dynamic>();
    myRequest["id"] = id;
    myRequest["name"] = name;
    myRequest["blood"] = blood;
    myRequest["age"] = age;
    myRequest["contact"] = contact;
    myRequest["address"] = address;
    myRequest["hospital"] = hospital;
    myRequest["Quantity"] = Quantity;
    myRequest["Bags"] = Bags;
    myRequest["Purpose"] = Purpose;

    return myRequest;
  }
}
