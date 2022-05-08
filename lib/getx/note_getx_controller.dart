import 'package:get/get.dart';

import '../controllers/models/notes.dart';
import '../controllers/note_db_controller.dart';

class NoteGetxController extends GetxController {
  RxList<Note> notes = <Note>[].obs; // Rx means Reactive >> Rx always comes with .obs
  final NoteDbController _noteDbController = NoteDbController();

  RxString name = "".obs;

  static NoteGetxController get to => Get.find();

  @override
  void onInit() {
    read();
    super.onInit();
  }

  Future<void> read() async {
    notes.value = await _noteDbController.getAllRows();
    // notifyListeners();
    // update();
  }

  Future<bool> create({required Note note}) async {
    int newRowId = await _noteDbController.createRow(note);
    if (newRowId != 0) {
      note.id = newRowId;
      notes.add(note);
      // notifyListeners(); // in Provider
      // update(); // in Getx >> we mustn't use it when we want to use RxList (Rx in general) and .obs
      name.refresh();
    }
    return (newRowId != 0);
  }

  Future<bool> updateNote({required Note note}) async {
    bool updated = await _noteDbController.updateRow(note);
    if (updated) {
      int index = notes.indexWhere((element) => element.id == note.id);
      if (index != 0) {
        notes[index] = note;
        // notifyListeners();
        // update();
      }
    }
    return updated;
  }

  Future<bool> delete({required int id}) async {
    bool deleted = await _noteDbController.deleteRow(id);
    if (deleted) {
      notes.removeWhere((element) => element.id == id);
      // notifyListeners();
      // update();
    }
    return deleted;
  }
}
