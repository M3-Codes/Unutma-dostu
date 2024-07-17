abstract class ICsvManager {
  Future<void> writeToFile(List<dynamic> row, String client);
  Future<List<List<dynamic>>> readFromNewFile(String client);
  Future<void> deleteRow(String kodu, String oldPath1, String oldPath2,
      String newPath1, String newPath2, String client);
  Future<List<bool>> isFull();
  Future<List<String>> tags();
}
