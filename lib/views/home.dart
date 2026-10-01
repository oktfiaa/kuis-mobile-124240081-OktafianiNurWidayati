import 'package:flutter/material.dart';
import 'package:kuis_mobile_124240081/models/data.dart';
import 'package:kuis_mobile_124240081/views/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = ""; //variabel search
  String selectedCategory = "Semua"; //var filter
  
  // final Product product;

  final List<String> type = ["Semua", "T-Shirt", "Jacket", "Pants", "Bag", "Accessories"];

  @override
  Widget build(BuildContext context) {
    //filter 
    final filteredMenus = catalog.where((item) {
      final matchesSearch =
          item.productName.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesCategory =
          selectedCategory == "Semua" || item.type == selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();

    return Column(
      //serach bar
      children: [ 
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: "Cari produk...",
              prefixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        // pil kategori
        SizedBox(
          height: 38,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: type.length,
            itemBuilder: (context, index) {
              final cat = type[index];
              final isSelected = selectedCategory == cat;
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: FilterChip(
                  label: Text(cat),
                  selected: isSelected,
                  selectedColor: Colors.pink.shade100,
                  onSelected: (selected) {
                    setState(() {
                      selectedCategory = cat;
                    });
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),

        //fav
        Expanded(
          child: filteredMenus.isEmpty
              ? const Center(
                  child: Text(
                    "Produk tidak ditemukan",
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  itemCount: filteredMenus.length,
                  itemBuilder: (context, index) {
                    final item = filteredMenus[index];
                    // final isFavorite = favoriteIds.contains(item.id);

                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(product: item),
                          ),
                        );
                      },

                      leading: Image.network(
                        item.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.fastfood),
                      ),
                      title: Text(item.productName),
                      subtitle: Text(item.price),

                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.favorite, color: Colors.pink, size: 18),
                          SizedBox(width: 4),
                          // Text(
                          //   // // '${product.likeCount}',
                          //   // style: const TextStyle(fontWeight: FontWeight.bold),
                          // ),
                          SizedBox(width: 12),
                          SizedBox(width: 12),
                          Icon(Icons.inventory_2_outlined, color: Colors.grey, size: 18),
                          SizedBox(width: 4),
                          // Text(
                          //   'Stok: ${product.stock}',
                          //   style: const TextStyle(color: Colors.grey),
                          // ),

                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
