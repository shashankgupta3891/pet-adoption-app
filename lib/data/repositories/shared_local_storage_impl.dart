import 'package:pet_adoption_app/domain/repositories/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocalStorageImpl implements LocalStorageRepository {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesLocalStorageImpl(this._sharedPreferences);

  @override
  Future<String?> getString(String key) {
    return Future<String?>.value(_sharedPreferences.getString(key));
  }

  @override
  Future<void> setString(String key, String value) {
    return _sharedPreferences.setString(key, value);
  }
}
