class UserModel {
  String? name;
  String? email;
  String? photoURL;

  Map<String, dynamic> toJson() => _itemToJson(this);

  UserModel({
    required this.name,
    required this.email,
    required this.photoURL,
  });
}

Map<String, dynamic> _itemToJson(UserModel instance) {
  return <String, dynamic>{
    'email': instance.email,
    'name': instance.name,
    'photoURL': instance.photoURL,
  };
}
