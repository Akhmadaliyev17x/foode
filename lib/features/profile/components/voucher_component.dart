import 'package:foode/config/router/router_libs.dart';

class VoucherComponent extends StatelessWidget {
  final String title;
  final SvgPicture svgIcon;
  const VoucherComponent(
      {super.key, required this.title, required this.svgIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: const [BoxShadow(color: AppColors.black34, blurRadius: 50)],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: svgIcon,
          ),
          const SizedBox(width: 10),
          Text(title, style: AppTextStyles.h5(color: AppColors.black)),
        ],
      ),
    );
  }
}
