part of '../professional.dart';

class ProfessionalBody extends StatelessWidget {
  const ProfessionalBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: ProfessionalScreenHelper().scrollController,
      thumbVisibility: true,
      child: ListWheelScrollView(
        physics: const FixedExtentScrollPhysics(),
        controller: ProfessionalScreenHelper().scrollController,
        useMagnifier: true,
        magnification: 1.25,
        itemExtent: MediaQuery.sizeOf(context).height * 0.8,
        // TODO(immadisairaj): update page to show dynamic data
        // childDelegate: ListWheelChildBuilderDelegate(
        //   childCount: <get_count_dynamic>,
        //   builder: (context, index) {
        //     return const Placeholder();
        //   },
        // ),
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.8,
            color: Colors.red,
            child: const UnderConstruction(),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.8,
            color: Colors.green,
            child: const UnderConstruction(),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.8,
            color: Colors.blue,
            child: const UnderConstruction(),
          ),
        ],
      ),
    );
  }
}
