import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject{

  @HiveField(0)
  String usrName;
  @HiveField(1)
  String usrEmail;
  @HiveField(2)
  String usrPassword;

  User({required this.usrName,required this.usrEmail,required this.usrPassword});

}