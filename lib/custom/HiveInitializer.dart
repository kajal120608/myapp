import 'package:hive/hive.dart';
import 'package:testapp/models/user.dart';

class HiveInitializer{

 static Future<void> initializeHive() async{
    Hive.registerAdapter(UserAdapter());
  }
}