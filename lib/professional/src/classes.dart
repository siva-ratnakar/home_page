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

class CarouselItem {
  const CarouselItem({
    required this.title,
    required this.time,
    this.description,
    this.link,
    this.flipText,
  });
  final String title;
  final String time;
  final String? description;
  final String? link;
  final String? flipText;
}
