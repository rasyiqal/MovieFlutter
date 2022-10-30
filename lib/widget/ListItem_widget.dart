List<Item> item = [
  Item(nama: 'Soto Madura', gambar: 'assets/Items1.png'),
  Item(nama: 'Soto Lamongan', gambar: 'assets/Items2.png'),
  Item(nama: 'Soto Malang', gambar: 'assets/Items3.png'),
  Item(nama: 'Soto Jepang', gambar: 'assets/Items4.png'),
  Item(nama: 'Soto Madiun', gambar: 'assets/Items5.png'),
  Item(nama: 'Soto Gresik', gambar: 'assets/Items6.png'),
];

class Item {
  String nama;
  String gambar;

  Item({required this.nama, required this.gambar});
}
