import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymnation/menu_utama/see_all_page.dart';

void main() {
  testWidgets('Test UI dan fungsi pencarian di SeeAllPage',
      (WidgetTester tester) async {
    // Menampilkan widget SeeAllPage dalam lingkungan pengujian
    await tester.pumpWidget(
      const MaterialApp(
        home: SeeAllPage(),
      ),
    );

    // Menunggu sampai UI selesai dirender
    await tester.pumpAndSettle();

    // Memastikan elemen UI statis muncul
    expect(find.text('See All'), findsOneWidget); // Judul halaman
    expect(find.text('Makanan'), findsOneWidget); // Item pertama
    expect(find.text('Fasilitas'), findsOneWidget); // Item kedua
    expect(find.text('Diskon'), findsOneWidget); // Item ketiga
    expect(find.text('Kelas'), findsOneWidget); // Item keempat

    // Mencari kolom pencarian dan mengisi teks "diskon"
    final searchField = find.byType(TextField);
    expect(searchField, findsOneWidget); // Pastikan kolom pencarian ditemukan

    await tester.enterText(searchField, 'diskon');
    await tester.pumpAndSettle(); // Tunggu hasil pencarian ditampilkan

    // Hanya item "Diskon" yang seharusnya muncul setelah pencarian
    expect(find.text('Diskon'), findsOneWidget);
    expect(find.text('Makanan'), findsNothing);
    expect(find.text('Fasilitas'), findsNothing);
    expect(find.text('Kelas'), findsNothing);

    // Menghapus teks pencarian agar semua item muncul kembali
    await tester.enterText(searchField, '');
    await tester.pumpAndSettle();

    // Semua item harus muncul kembali
    expect(find.text('Makanan'), findsOneWidget);
    expect(find.text('Fasilitas'), findsOneWidget);
    expect(find.text('Diskon'), findsOneWidget);
    expect(find.text('Kelas'), findsOneWidget);
  });
}
