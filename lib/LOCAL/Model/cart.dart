//Table Name
var tableNameCart = 'cart';

//Field Name in database
class CartFields{

  static final List<String> values = [
    id, product_id, products, price, total, status
  ];

  static String id          = '_id';
  static String product_id  = 'product_id';
  static String products    = 'products';
  static String price       = 'price';
  static String total       = 'total';
  static String status      = 'status';
}

//Model for send/get data from database
class Cart{
  var id;
  var product_id;
  var products;
  var price;
  var total;
  var status;

  Cart({
    this.id,
    this.product_id,
    this.products,
    this.price,
    this.total,
    this.status
  });

  Cart copy({
    int? id,
    String? product_id,
    String? products,
    String? price,
    String? total,
    int? status,
  }) => Cart(
      id          : id ?? this.id,
      product_id  : product_id ?? this.product_id,
      products    : products ?? this.products,
      price       : price ?? this.price,
      total       : total ?? this.total,
      status      : status ?? this.status
  );
  static Cart fromJson(Map<String, Object?> json) => Cart(
      id          : json[CartFields.id] as int?,
      product_id  : json[CartFields.product_id] as String,
      products    : json[CartFields.products] as String?,
      price       : json[CartFields.price] as String?,
      total       : json[CartFields.total] as String?,
      status      : json[CartFields.status]);

  Map<String, Object?> toJson() => {
    CartFields.id         : id,
    CartFields.product_id : product_id,
    CartFields.products   : products,
    CartFields.price      : price,
    CartFields.total      : total,
    CartFields.status     : status,
  };
}