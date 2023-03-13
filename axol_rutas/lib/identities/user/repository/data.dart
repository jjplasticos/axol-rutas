class Data {
  const Data();
  Stream<String> data() {
    return Stream.value('un dato en stream');
  }
}
