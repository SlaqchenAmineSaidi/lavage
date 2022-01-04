class Service {
  int price;
  String title;

  Service({this.price, this.title});

  Service.fromJson(Map<String, dynamic> json)
      : price = json['price'],
        title = json['title'];
}
