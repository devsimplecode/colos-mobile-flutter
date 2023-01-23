part of '../screen_map.dart';

class _MapHeader extends StatelessWidget {
  const _MapHeader({
    Key? key,
    required this.shipment,
  }) : super(key: key);
  final String shipment;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 10, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBackButton(),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: theme.cardTheme.color,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 4,
                    blurRadius: 7,
                  ),
                ],
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppAssets.svg.boxCompleted, height: 20),
                  const SizedBox(width: 7),
                  Text(
                    shipment,
                    style: AppTextStyle.s13w600.copyWith(
                      color: theme.navigationBarTheme.indicatorColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
