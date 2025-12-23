import 'package:flutter/material.dart';

class MultiSelectCategory extends StatelessWidget {
  // قائمة العناصر التي سيتم عرضها
  final List<Map<String, String>> items;
  // القائمة التي تحتوي على القيم المختارة حالياً
  final List<String> selectedItems;
  // دالة سيتم استدعاؤها عند تغيير الاختيار
  final Function(List<String>) onSelectionChanged;

  const MultiSelectCategory({
    Key? key,
    required this.items,
    required this.selectedItems,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: "حدد الشرائح المستهدفة",
        border: OutlineInputBorder(),
        errorText: selectedItems.isEmpty
            ? "الرجاء تحديد شريحة واحدة على الأقل"
            : null,
      ),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: items.map((item) {
          final isSelected = selectedItems.contains(item['value']);
          return FilterChip(
            label: Text(item['title']!),
            selected: isSelected,
            onSelected: (isSelected) {
              final newSelection = List<String>.from(selectedItems);
              if (isSelected) {
                newSelection.add(item['value']!);
              } else {
                newSelection.remove(item['value']!);
              }
              onSelectionChanged(newSelection);
            },
            selectedColor: Colors.blue.shade200,
            checkmarkColor: Colors.blue.shade900,
          );
        }).toList(),
      ),
    );
  }
}
