abstract class TodoRepo {
  
  Future init();

  Stream<List<dynamic>> todoList();
}
