import 'package:hive/hive.dart';

part 'user_profile_model.g.dart';

@HiveType(typeId: 2)
class UserProfileModel extends HiveObject {
  @HiveField(0)
  final String userProfileImageUrl;

  UserProfileModel({required this.userProfileImageUrl});
}
