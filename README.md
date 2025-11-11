Punya M. Fadhlurrohman Pasya
2406411830

Tugas 7
1.
Semua di flutter adalah widget
Widget tree adalah cara menstruktur widget-widget tersebut
Child widgets bekerja dengan sebuah context dari parentnya dan melakukan suatu hal diatas itu
2.  
di main.dart:
MaterialApp dengan text judul dan tema ThemeData yang berisi Colorscheme, yang menentukan warna
di menu.dart:
Build Scaffold yang menjelaskan strukturnya yang berbentuk AppBar dan body.
AppBar juga memiliki Text yang memiliki Textsyle dan backgroundcolor
Body berbentuk padding yang memiliki EdgeInsets, dan cihldren yang berbentuk Column, untuk disusun secara vertikal
di column memiliki children berbentuk Row yang memiliki InfoCard berisi NPM, Nama, dan Kelas
ada SizedBox untuk menampilkan sambutan dengan Textstyle, juga untuk memisahkan row diatas dengan
Center yang berisi Column yang memiliki Padding yang memiliki Edgeinsets dan Text sendiri
Center juga memiliki GridView.count yang berfungsi untuk menampilkan ItemCard
class InfoCard memiliki widget build yang berisi Card yang memiliki Container dengan Edgeinsets dan children yang berbentuk Column dengan Text yang akan disusun secara vertikal
class ItemCard memiliki widget build yang berisi Material yang memiliki child InkWell yang bisa ditekan
InkWell itu memiliki child Container yang berCenter dan berColumn yang menampilkan Icon dan Padding sebelum Text
3.
MaterialApp adalah widget yang membiarkan user menggunakan segala keperluan yang digunakan untuk aplikasi Material Design dalam satu widget
karena itu MaterialApp biasa digunakan sebagai widget root
4.
stateless widget cocok digunakan untuk teks dan gambar karena tidak akan berubah
stateful widget cocok untuk hal yang dinamis seperti hasil interaksi dan kotak centang karena memiliki state yang bisa dirubah
5.
BuildContext adalah context bagaimana parent dari suatu child terbentuk. itu membantu build untuk mengerti context dari parentnya
6.
Hot restart mengulang kembali load suatu aplikasi. Segala data dan state aplikasi akan hilang
Hot reload memungkinkan untuk membuat perubahan tampa menghapus state dan data aplikasi

Tugas 8
1. push() menaruh rute baru ke bagian atas stack navigasi. Sehingga user bisa menekan tombol back untuk kembali ke halaman sebelumnya
pushReplacement() tidak memungkinkan kembali menggunakan back
2. Scaffold adalah dasar dari widget. Bisa mengandung appBar, body, drawer, bottomNavigationBar, dan lain-lain
appBar adalah bar yang ada di bagian atas layar. appBar berada di dalam Scaffold
Drawe ittu yg muncul disamping. berada di dalam Scaffold
3. Padding untuk padding. Keliatan bagus 👍. Contoh padding antar elemen di form
SingleChildScrollView untuk penge-scroll-an. Ini berguna ketika konten panjang kebawah sehingga perluh menge-scroll. contoh SingleChildScrollView contohnya ada di form karena kalau terlalu panjang untuk layar pengguna akan perluh scroll
ListView juga untuk penge-scroll tapi lebih bagus untuk benda yang banyak dan seragam
4. Belum diubah. Tapi kalau ingin diubah tinggal ctrl+f semua yang ada warna lalu diubah jadi tema oren futbal news yg di web (+ warna-warna lain yg mendukung tema juga)