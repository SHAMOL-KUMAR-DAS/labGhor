class Item{
  var name, details;
  Item({this.name, this.details});
}

class Description{
  var lists = [
    Item(
        name: 'Herbal Remedies',
        details: '71.8',
    ),
    Item(
        name: 'Swallowing Raw Fish',
        details: '5.8'
    ),
    Item(
        name: 'Spiritual Therapy',
        details: '35.9'
    ),
    Item(
        name: 'Energy healing Therapy',
        details: '3.8'
    ),
    Item(
        name: 'Wet Cupping',
        details: '2.9'
    ),
    Item(
        name: 'Gem Therapy',
        details: '1.9'
    ),
    Item(
        name: 'Other',
        details: '2.9'
    ),
  ];
}