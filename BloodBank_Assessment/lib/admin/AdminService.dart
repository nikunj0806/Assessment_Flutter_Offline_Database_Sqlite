import 'package:practicdatabase/admin/Admin.dart';
import 'package:practicdatabase/admin/Repositor.dart';

class Adminservice {
  late Repositor repository;

  Adminservice() {
    repository = Repositor();
  }

  insertService(Admin admin) {
    return repository.insertData("Bloodbank", admin.AdminMap());
  }

  readService() {
    return repository.readData("Bloodbank");
  }

  updateService(Admin admin) {
    return repository.updateData("Bloodbank", admin.AdminMap());
  }

  deletService(Admin admin) {
    return repository.deleteData("Bloodbank", admin.AdminMap());
  }
}
