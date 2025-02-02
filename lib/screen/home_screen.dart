import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_shop/color/app_colors.dart';
import 'package:plant_shop/plants_class/plants_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          // Top Portion
          TopPortion(),
          // Search Potion
          SearchPortion(),
          // Categories Tab
          CatagorysTab(),
          // Plant List
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: GridView.builder(
              itemCount: plants.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return PlantItemCard(plant: plants[index]);
              },
            ),
          )),
        ],
      )),
    );
  }
}

class PlantItemCard extends StatelessWidget {
  final Plant plant;
  const PlantItemCard({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 10.0),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Image.asset(plant.image)),
                  Text(
                    plant.name,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.taxtBlack),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        plant.price,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.red),
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            color: AppColors.primaryGreen,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Icon(Icons.add, color: Colors.white,),
                      ),
                    ],
                  )
                ],
              ),
              Positioned(

                top: 10, 
                child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.favorite_border, color: AppColors.primaryGreen,),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}

class TopPortion extends StatelessWidget {
  const TopPortion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Welcome to",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              SvgPicture.asset("assets/cart-shopping.svg"),
            ],
          ),
          Text(
            "Plant Shop",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryGreen),
          ),
        ],
      ),
    );
  }
}

class SearchPortion extends StatelessWidget {
  const SearchPortion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                fillColor: AppColors.lightGray,
                filled: true,
                prefixIcon: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset("assets/search.svg")),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: SvgPicture.asset(
                "assets/filter.svg",
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              )),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class CatagorysTab extends StatefulWidget {
  const CatagorysTab({super.key});

  @override
  State<CatagorysTab> createState() => _CatagorysTabState();
}

class _CatagorysTabState extends State<CatagorysTab> {
  int selectedIndex = 0;

  final List<String> categories = ["POPULAR", "ORGANIC", "INDOOR", "SYNTHETIC"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: SingleChildScrollView(
        child: Row(
          children: categories.map((catagory) {
            int index = categories.indexOf(catagory);
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 42),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      catagory,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: index == selectedIndex
                            ? AppColors.primaryGreen
                            : AppColors.taxtBlack.withValues(alpha: 0.5),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      margin: EdgeInsets.only(top: 7.0),
                      padding: EdgeInsets.symmetric(
                          horizontal: selectedIndex == index ? 26.0 : 0.0,
                          vertical: 2.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11.0),
                          color: index == selectedIndex
                              ? AppColors.primaryGreen
                              : Colors.transparent),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
