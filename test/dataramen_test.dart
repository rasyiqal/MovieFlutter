/*
  Mengolah data json dari http request menggunakan JSON
  Notes
  - lokasi file ini terletak pada ./test/namabebas_test.dart
  - nama file ini harus ada namabebas_test.dart
*/

// 1. install package dio terlebih dahulu, dan import ke sini
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movie/service/remote_service.dart';

// 2. menggunakan asyncronous untuk ambil data api
Future<void> main() async {
  // 3. inisasikan sebuah package Dio
  Dio dio = Dio();

  /* 4. variable dio dapat diakses berbagai method salah 
  satunya get untuk mengambil data dari http request */
  // var response = await dio
  //     .get('https://my-does-app-5c4a7-default-rtdb.firebaseio.com/ramene.json');
  // print('status code : ${response.statusCode}');
  // var dataResponse = response.data;

  var res = RemoteService();
await res.fecthDataUsers();

  // soal 1
  // tampilkan message / pesan dari response yang didapat
  // print(dataResponse["message"]);

  // soal 2
  // tampilkan semua data dari response yang didapat
  // tidak termasuk message / pesan
  // print(dataResponse["data"]);

  // soal 3
  // tampilkan data pada urutan pertama saja
  // print(dataResponse["data"][0]);

  // soal 4
  // tampilkan tulisan Hot Lava Ramene
  // print (dataResponse["data"][0]["img_Url"]);

  // 5. Cek hasil response
  // print(dataResponse);
}
