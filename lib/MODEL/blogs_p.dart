class BlogItems{
  var image, title;
  BlogItems({this.image, this.title});
}

class Blogs{
  var lists = [
    BlogItems(
      image: 'assets/images/medicine.png',
      title: 'Medicine'
    ),
    BlogItems(
        image: 'assets/images/diagnosis.png',
        title: 'Medicine'
    ),
    BlogItems(
        image: 'assets/images/shop.png',
        title: 'Medicine'
    ),
    BlogItems(
        image: 'assets/images/remainder.png',
        title: 'Medicine'
    ),
    BlogItems(
        image: 'assets/images/splash.png',
        title: 'Medicine'
    ),
    BlogItems(
        image: 'assets/images/sign_in.png',
        title: 'Medicine'
    )
  ];
}