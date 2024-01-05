// TODO(immadisairaj): update the classes to meet requirement
class ProfessionalItem {
  const ProfessionalItem({
    required this.title,
    required this.iconImagePath,
    this.itemsList,
  });
  final String title;
  final String iconImagePath;
  final List<CarouselItem>? itemsList;
}

class CarouselItem {}
