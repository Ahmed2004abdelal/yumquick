class BottomNavBarModel {
  final String label;
  final String icon;
  final int id;
  final String route;

  BottomNavBarModel({
    required this.label,
    required this.icon,
    required this.id,
    required this.route,
  });
}

final List<BottomNavBarModel> bottomNavItems = [
  BottomNavBarModel(
    id: 0,
    label: 'Home',
    icon: 'assets/icons/home-icon.svg',
    route: '/home',
  ),
  BottomNavBarModel(
    id: 1,
    label: 'Favorites',
    icon: 'assets/icons/favorites-icon.svg',
    route: '/favorites',
  ),
  BottomNavBarModel(
    id: 2,
    label: 'My Orders',
    icon: 'assets/icons/my-orders-icon.svg',
    route: '/my-orders',
  ),
  BottomNavBarModel(
    id: 3,
    label: 'Help',
    icon: 'assets/icons/help-icon.svg',
    route: '/help',
  ),
];
