import 'package:flutter/material.dart';
// TODO: Impor drawer

class NewsFormPage extends StatefulWidget {
  const NewsFormPage({super.key});

  @override
  State<NewsFormPage> createState() => _NewsFormPageState();
}

class _NewsFormPageState extends State<NewsFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  String _thumbnail = "";
  String? _category;
  bool _is_featured = false;

  final List<String> _categories = [
    'futwear',
    'cloathing itm',
    'merchant dice',
    'spourts itm',
    'others'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add News Form',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      // TODO: Tambahkan drawer yang sudah dibuat di sini
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
            // === Name ===
            Padding(
            padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Nama barang",
              labelText: "Nama barang",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _name = value!;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Nama tidak boleh kosong!";
              }
              return null;
            },
          ),
            ),
          // === Price ==
          Padding(
          padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Herga Barang",
          labelText: "Harga Barang",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        keyboardType: TextInputType.number,
        onChanged: (String? value) {
          setState(() {
            _price = int.tryParse(value!) ?? 0;
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Harga tidak boleh kosong!";
          }
          if (int.tryParse(value) == null){
            return "Harga harus berupa angka!";
          }
          if (int.parse(value) < 0){
            return "Harga tidak boleh negatif!";
          }
          return null;
        },
        ),
      ),
        // === Description ===
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Deskripsikan apa jualanmu!",
              labelText: "Deskripsikan apa jualanmu!",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _description = value!;
              });
            },
            validator: (String? value)  {
              if (value == null || value.isEmpty) {
                return "Deskripsi tidak boleh kosong!";
              }
              return null;
            },
          ),
        ),
        // === thumbnail ===
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Link gambar barang",
              labelText: "Link gambar barang",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _thumbnail = value!;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Gambar tidak boleh kosong!";
              }// TODO: pas nanti biar ada gambar default "no picture" kalo gk ada dari user
              bool isUrl = Uri.tryParse(value)?.hasAbsolutePath ?? false;
              if (!isUrl) {
                return "Tolong masukkan link gambar yang valid (contoh: https://...)";
              }
              return null;
            },
          ),
        ),
        // === category ===
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: "Kategori",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            hint: const Text("Pilih kategori"),
            value: _category,
            items: _categories
                .map((cat) => DropdownMenuItem(
              value: cat,
              child: Text(
                  cat[0].toUpperCase() + cat.substring(1)),
            ))
                .toList(),
            onChanged: (String? newValue) {
              setState(() {
                _category = newValue!;
              });
            },
            validator: (String? value)  {
              if (value == null || value.isEmpty) {
                return "Kategori tidak boleh kosong!";
              }
              return null;
            },
          ),
        ),
        // === Is Featured ===
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SwitchListTile(
            title: const Text("Tandai sebagai Berita Unggulan"),
            value: _is_featured,
            onChanged: (bool value) {
              setState(() {
                _is_featured = value;
              });
            },
          ),
        ),
                  // === Tombol Simpan ===
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.indigo),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Produk berhasil tersimpan'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text('Nama: $_name'),
                                        Text('Harga: $_price'),
                                        Text('Deskripsi: $_description'),
                                        Text('Kategori: $_category'),
                                        Text('Thumbnail: $_thumbnail'),
                                        Text(
                                            'Unggulan: ${_is_featured ? "Ya" : "Tidak"}'),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        _formKey.currentState!.reset();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );

                          }
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
            )
            )
      )
    );
  }
}