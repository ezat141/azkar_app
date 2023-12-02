import 'package:azkar_app/cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key,required this.selectedItem, required this.onItemTapped, required this.items});
  final NavigationItem selectedItem;
  final Function(NavigationItem) onItemTapped;
  final List<CustomBottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,//  color was white
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 2,
        //   ),
        // ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          final itemIndex = items.indexOf(item);
        final isSelected = itemIndex == selectedItem.index;
          return GestureDetector(
            onTap: () {
              onItemTapped(NavigationItem.values[itemIndex]);
            },
            child: _buildItem( context, itemIndex, item.iconData, isSelected),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildItem(BuildContext context,  int itemIndex, IconData iconData, bool isSelected) {
  final navigationCubit = BlocProvider.of<NavigationCubit>(context);

  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    // decoration: BoxDecoration(
    //   border: Border(
    //     top: BorderSide(
    //       color: isSelected ? Colors.blue : Colors.transparent,
    //       width: 2,
    //     ),
    //   ),
    // ),
    child: GestureDetector(
      onTap: () {
        // Update the selected item in the NavigationCubit
        final selectedItem = NavigationItem.values[itemIndex];
        navigationCubit.setNavigationItem(selectedItem);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Icon(
          iconData,
          color: isSelected ? const Color(0xff7d904e) : Colors.grey,
        ),
      ),
    ),
  );
}

}
class CustomBottomNavigationBarItem {
  final IconData iconData;
  //final String label;

  CustomBottomNavigationBarItem({
    required this.iconData,
  });
}
