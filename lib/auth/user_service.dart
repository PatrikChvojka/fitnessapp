class UserModel {
  String? name;
  String? email;

  Map<String, dynamic> toJson() => _itemToJson(this);

  UserModel({
    required this.name,
    required this.email,
  });
}

Map<String, dynamic> _itemToJson(UserModel instance) {
  return <String, dynamic>{
    'email': instance.email,
    'name': instance.name,
  };
}
