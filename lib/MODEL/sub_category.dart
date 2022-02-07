class Items{
  var sub_image, sub_name, sub_price, sub_description, sub_share;

  Items({this.sub_image, this.sub_name, this.sub_price, this.sub_description, this.sub_share});
}

class SubCategory{
  var lists = [

    Items(
        sub_image: 'assets/images/demo1.png',
        sub_name: 'Napa Extra',
        sub_price: '৳ 5.00',
        sub_description: 'In Stock'
    ),
    Items(
        sub_image: 'assets/images/demo2.png',
        sub_name: 'Dacarbazine',
        sub_price: '৳ 50',
        sub_description: 'Out Of Stock'
    ),
    Items(
        sub_image: 'assets/images/demo3.png',
        sub_name: 'Dapsone',
        sub_price: '৳ 30',
        sub_description: 'In Stock'
    ),
    Items(
        sub_image: 'assets/images/demo4.png',
        sub_name: 'Dopamine',
        sub_price: '৳ 350',
        sub_description: 'Out Of Stock'
    ),
    Items(
        sub_image: 'assets/images/demo5.png',
        sub_name: 'Dronabinol',
        sub_price: '৳ 6800',
        sub_description: 'In Stock'
    ),
    Items(
        sub_image: 'assets/images/demo6.png',
        sub_name: 'Eltrombopag',
        sub_price: '৳ 150',
        sub_description: 'Out Of Stock'
    ),
    Items(
        sub_image: 'assets/images/demo7.png',
        sub_name: 'Erlotinib',
        sub_price: '৳ 500',
        sub_description: 'Out Of Stock'
    ),
    Items(
        sub_image: 'assets/images/demo1.png',
        sub_name: 'Famotidine',
        sub_price: '৳ 300',
        sub_description: 'In Stock'
    ),
    Items(
        sub_image: 'assets/images/demo2.png',
        sub_name: 'Gabapentin',
        sub_price: '৳ 35',
        sub_description: 'Out Of Stock'
    ),
    Items(
        sub_image: 'assets/images/demo3.png',
        sub_name: 'Gefitnib',
        sub_price: '৳ 6800',
        sub_description: 'Out Of Stock'
    ),
    Items(
        sub_image: 'assets/images/demo4.png',
        sub_name: 'Napa Extra',
        sub_price: '৳ 5.00',
        sub_description: 'In Stock'
    ),
    Items(
        sub_image: 'assets/images/demo5.png',
        sub_name: 'Dacarbazine',
        sub_price: '৳ 50',
        sub_description: 'Out Of Stock'
    ),
    Items(
        sub_image: 'assets/images/demo6.png',
        sub_name: 'Dapsone',
        sub_price: '৳ 30',
        sub_description: 'Out Of Stock'
    ),
    Items(
        sub_image: 'assets/images/demo7.png',
        sub_name: 'Dopamine',
        sub_price: '৳ 350',
        sub_description: 'In Stock'
    ),
    Items(
        sub_image: 'assets/images/demo1.png',
        sub_name: 'Dronabinol',
        sub_price: '৳ 6800',
        sub_description: 'In Stock'
    ),
    Items(
        sub_image: 'assets/images/demo2.png',
        sub_name: 'Eltrombopag',
        sub_price: '৳ 150',
        sub_description: 'In Stock'
    ),
    Items(
        sub_image: 'assets/images/demo3.png',
        sub_name: 'Erlotinib',
        sub_price: '৳ 500',
        sub_description: 'Out Of Stock'
    ),
    Items(
        sub_image: 'assets/images/demo4.png',
        sub_name: 'Famotidine',
        sub_price: '৳ 300',
        sub_description: 'Out Of Stock'
    ),
    Items(
        sub_image: 'assets/images/demo5.png',
        sub_name: 'Gabapentin',
        sub_price: '৳ 35',
        sub_description: 'In Stock'
    ),
    Items(
        sub_image: 'assets/images/demo6.png',
        sub_name: 'Gefitnib',
        sub_price: '৳ 6800',
        sub_description: 'Out Of Stock'
    ),
    Items(
        sub_image: 'assets/images/demo7.png',
        sub_name: 'Gefitnib',
        sub_price: '৳ 6800',
        sub_description: 'In Stock'
    ),

  ];
}

Future SearchSubCategories() async {
  return SubCategory();
}