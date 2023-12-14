import 'package:flutter/material.dart';

enum LaunchSortOption {
  name,
  launchTime,
}

// List<DropdownMenuItem<LaunchSortOption>> buildDropdownMenuItems() {
//   return LaunchSortOption.values.map((option) {
//     return DropdownMenuItem<LaunchSortOption>(
//       value: option,
//       child: Text(option == LaunchSortOption.name ? 'Name' : 'Launch Time'),
//     );
//   }).toList();
// }

List<DropdownMenuItem<LaunchSortOption>> buildDropdownMenuItems() {
  return LaunchSortOption.values.map((option) {
    String name;
    switch (option) {
      case LaunchSortOption.name:
        name = 'Name';
        break;
      case LaunchSortOption.launchTime:
        name = 'Launch Time';
        break;
      // Add other options here
    }
    return DropdownMenuItem(
      value: option,
      child: Text(name),
    );
  }).toList();
}
