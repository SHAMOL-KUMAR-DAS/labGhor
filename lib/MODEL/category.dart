class Item{
  var item_image, item_name;
  Item({this.item_image, this.item_name});
}

class Category{
  var lists = [
    Item(
      item_image: 'assets/images/demo1.png',
      item_name: 'CNS Depressants',
    ),

    Item(
      item_image: 'assets/images/demo2.png',
      item_name: 'CNS Stimulants',
    ),
    Item(
      item_image: 'assets/images/demo3.png',
      item_name: 'Hallucinogens',
    ),
    Item(
      item_image: 'assets/images/demo4.png',
      item_name: 'Disassociative',
    ),
    Item(
      item_image: 'assets/images/demo5.png',
      item_name: 'Narcotic',
    ),
    Item(
      item_image: 'assets/images/demo6.png',
      item_name: 'Inhalants',
    ),
    Item(
      item_image: 'assets/images/demo7.png',
      item_name: 'Anthestics',
    ),
    Item(
      item_image: 'assets/images/demo1.png',
      item_name: 'Cannabis',
    ),
    Item(
      item_image: 'assets/images/demo3.png',
      item_name: 'Analgesics',
    ),
    Item(
      item_image: 'assets/images/demo5.png',
      item_name: 'Hallucinogens',
    ),
    Item(
      item_image: 'assets/images/demo4.png',
      item_name: 'Disassociative',
    ),
    Item(
      item_image: 'assets/images/demo2.png',
      item_name: 'Narcotic',
    ),
    Item(
      item_image: 'assets/images/demo4.png',
      item_name: 'Inhalants',
    ),
    Item(
      item_image: 'assets/images/demo6.png',
      item_name: 'CNS Depressants',
    ),
    Item(
      item_image: 'assets/images/demo7.png',
      item_name: 'CNS Depressants',
    ),

  ];
}

Future SearchCategories() async{
  return Category();
}