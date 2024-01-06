part of '../professional.dart';

class ProfessionalBody extends StatelessWidget {
  const ProfessionalBody({super.key});

  final proffItems = Constants.professionalItems;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final backImageSize = min(screenHeight, screenWidth) * 0.2;
    return RawScrollbar(
      controller: ProfessionalScreenHelper().scrollController,
      thumbVisibility: true,
      trackVisibility: true,
      radius: const Radius.circular(20),
      thickness: 10,
      thumbColor: Colors.black,
      child: ListWheelScrollView.useDelegate(
        physics: const FixedExtentScrollPhysics(),
        controller: ProfessionalScreenHelper().scrollController,
        useMagnifier: true,
        magnification: 1.25,
        itemExtent: screenHeight * 0.8,
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: proffItems.length,
          builder: (context, index) {
            return SizedBox(
              width: screenWidth * 0.8,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.12,
                        vertical: screenHeight * 0.12,
                      ),
                      // TODO(immadisairaj): add the carousels
                      child: const UnderConstruction(
                        color: Colors.black12,
                        textColor: Colors.black,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * 0.05,
                        left: 8,
                      ),
                      child: SizedBox(
                        width: backImageSize,
                        height: backImageSize,
                        child: Image.asset(
                          proffItems[index].iconImagePath,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
