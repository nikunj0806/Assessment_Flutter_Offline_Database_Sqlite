// import 'package:practicdatabase/admin/Admin.dart';
// import 'package:practicdatabase/admin/Repositor.dart';
import 'package:practicdatabase/request/request.dart';
import 'package:practicdatabase/request/requestRepositor.dart';

class Requestservice {
  late Requestrepositor _requestRepository;

  Requestservice() {
    _requestRepository = Requestrepositor();
  }

  insertService(Request request) {
    return _requestRepository.insertData("RequestBank", request.RequestMap());
  }

  readService() {
    return _requestRepository.readData("RequestBank");
  }

  updateService(Request request) {
    return _requestRepository.updateData("RequestBank", request.RequestMap());
  }

  deletService(Request request) {
    return _requestRepository.deleteData("RequestBank", request.RequestMap());
  }
}
