List<Item> item = [
  Item(nama: 'Captain America', gambar: 'assets/Captain America.png'),
  Item(nama: 'Deadpool', gambar: 'assets/Deadpool.png'),
  Item(nama: 'Dr.Strange', gambar: 'assets/Dr.Strange.png'),
  Item(nama: 'Loki', gambar: 'assets/Loki.png'),
  Item(nama: 'Thor', gambar: 'assets/thor.png'),
  Item(nama: 'Ragnarok', gambar: 'assets/ragnarok.png'),
];

class Item {
  String nama;
  String gambar;

  Item({
    required this.nama,
    required this.gambar,
  });
}
