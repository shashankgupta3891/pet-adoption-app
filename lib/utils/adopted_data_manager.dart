class AdoptedDataManager {
  Set<String> _data = {};

  List<String> get list => _data.toList();

  Set<String> get set => _data;

  AdoptedDataManager(String? data) {
    if (data?.isNotEmpty ?? false) {
      _data = data?.split(",").toSet() ?? {};
    }
  }

  void add(String id) {
    _data.add(id);
  }

  @override
  String toString() {
    return _data.toList().join(",");
  }
}
