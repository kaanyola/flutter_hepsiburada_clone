import 'package:flutter/material.dart';
import 'package:hepsiburada_clone/category_item.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String aranan = "";
  static List<CategoryItem> _categories = [
    CategoryItem(categoryName: "Elektronik", icon: "assets/images/laptop.png"),
    CategoryItem(categoryName: "Moda", icon: "assets/images/ayakkabi.png"),
    CategoryItem(
        categoryName: "Ev, Yaşam, Kırtasiye, Ofis",
        icon: "assets/images/sandalye.png"),
    CategoryItem(
        categoryName: "Oto, Bahçe, Yapı Market",
        icon: "assets/images/matkap.png"),
    CategoryItem(
        categoryName: "Anne, Bebek, Oyuncak",
        icon: "assets/images/bebekarabasi.png"),
    CategoryItem(
        categoryName: "Spor, Outdoor", icon: "assets/images/cadir.png"),
    CategoryItem(
        categoryName: "Kozmetik, Kişisel Bakım",
        icon: "assets/images/parfum.png"),
    CategoryItem(
        categoryName: "Süpermarket, Pet Shop", icon: "assets/images/sut.png"),
    CategoryItem(
        categoryName: "Kitap, Müzik, Film, Hobi",
        icon: "assets/images/book.png"),
  ];

  static List<String> filteredCategories;
  static List<String> filteredIcons;

  static List<String> kategoriisimler = [
    "Elektronik",
    "Moda",
    "Ev, Yaşam, Kırtasiye, Ofis",
    "Oto, Bahçe, Yapı Market",
    "Anne, Bebek, Oyuncak",
    "Spor, Outdoor",
    "Kozmetik, Kişisel Bakım",
    "Süpermarket, Pet Shop",
    "Kitap, Müzik, Film, Hobi",
  ];

  static List<String> kategoriiconlar = [
    "assets/images/laptop.png",
    "assets/images/ayakkabi.png",
    "assets/images/sandalye.png",
    "assets/images/matkap.png",
    "assets/images/bebekarabasi.png",
    "assets/images/cadir.png",
    "assets/images/parfum.png",
    "assets/images/sut.png",
    "assets/images/book.png"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredCategories = kategoriisimler;
    filteredIcons = kategoriiconlar;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 14, left: 14, right: 14),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSearchBox(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 36,
                        ),
                        buildTitleText(),
                        SizedBox(
                          height: 42,
                        ),
                        buildCategoryList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView buildCategoryList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: filteredCategories.length,
      itemBuilder: (context, index) {
        return buildCategoryItem(index);
      },
    );
  }

  Container buildCategoryItem(int index) {
    return Container(
      height: 70,
      child: FlatButton(
        onPressed: () {},
        padding: EdgeInsets.all(0),
        child: Row(
          children: [
            SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(
                  filteredIcons[index],
                )),
            SizedBox(
              width: 10,
            ),
            Text(
              filteredCategories[index],
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700]),
            )
          ],
        ),
      ),
    );
  }

  Text buildTitleText() {
    return Text(
      "Kategoriler",
      style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w600,
          color: Colors.grey[800],
          letterSpacing: 0.7),
    );
  }

  Widget buildSearchBox() {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          filteredCategories = kategoriisimler
              .where((element) =>
                  element.toLowerCase().contains(value.toLowerCase()))
              .toList();
          filteredIcons = kategoriiconlar
              .where((element) =>
                  kategoriisimler[kategoriiconlar.indexOf(element)]
                      .toLowerCase()
                      .contains(value.toLowerCase()))
              .toList();
        });
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          prefixIcon: Icon(Icons.search),
          hintText: "Ürün, kategori veya marka ara"),
    );
  }
}
