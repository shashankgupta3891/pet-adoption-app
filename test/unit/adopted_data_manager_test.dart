import 'package:flutter_test/flutter_test.dart';
import 'package:pet_adoption_app/utils/adopted_data_manager.dart';

void main() {
  group('AdoptedDataManager', () {
    test('should initialize with empty data when provided data is null', () {
      final manager = AdoptedDataManager(null);
      expect(manager.list, <String>[]);
      expect(manager.set, <String>{});
    });

    test('should initialize with empty data when provided data is empty', () {
      final manager = AdoptedDataManager('');
      expect(manager.list, <String>[]);
      expect(manager.set, <String>{});
    });

    test('should initialize with correct data when provided data is not empty',
        () {
      final manager = AdoptedDataManager('1,2,3');
      expect(manager.list, ['1', '2', '3']);
      expect(manager.set, {'1', '2', '3'});
    });

    test('should add data correctly', () {
      final manager = AdoptedDataManager('1,2');
      manager.add('3');
      expect(manager.list, ['1', '2', '3']);
      expect(manager.set, {'1', '2', '3'});
    });

    test('toString should return a comma-separated string of data', () {
      final manager = AdoptedDataManager('1,2,3');
      expect(manager.toString(), '1,2,3');
    });
  });
}
