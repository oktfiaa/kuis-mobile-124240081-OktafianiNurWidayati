import 'package:flutter/material.dart';
import 'package:kuis_mobile_124240081/models/data.dart';


class DetailPage extends StatelessWidget {
  final Product product;

  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 238, 247), // Background
      appBar: AppBar(
        title: Text(product.productName),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //sudut melengkung 
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                product.imageUrl,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.fastfood, size: 60),
                ),
              ),
            ),
            SizedBox(height: 16),

            //nama menu
            Text(
              product.productName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            //kategori menu
            Text(
              product.type,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Harga
                Text(
                  product.price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),

                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.pink, size: 18),
                    SizedBox(width: 4),
                    Text(
                      '${product.likeCount}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.inventory_2_outlined, color: Colors.grey, size: 18),
                    SizedBox(width: 4),
                    Text(
                      'Stok: ${product.stock}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),

            // Pilihan Ukuran
            Text(
              "Ukuran Tersedia",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),

            // Daftar Ukuran (Menggunakan Wrap agar tidak overflow)
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: product.sizes.map((size) {
                return Chip(
                  label: Text(
                    size.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.pink.shade200),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            //judul deskripsi
            Text(
              "Deskripsi",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),

            //isi des
            Text(
              product.details,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade700,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

