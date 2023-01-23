import 'package:colos/constants/app_text_styles.dart';
import 'package:colos/constants/assets.dart';
import 'package:colos/features/map/widgets/routes_bottom_sheet.dart';
import 'package:colos/l10n/generated/l10n.dart';
import 'package:colos/models/shipments_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapBottomWidget extends StatelessWidget {
  const MapBottomWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  final ShipmentsRouteWithLocationEntity data;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () async {
        await showRoutesBottomSheet(
          context: context,
          route: data,
        );
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: theme.primaryColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        S.of(context).Info,
                        style: AppTextStyle.s16w600.copyWith(
                          color: theme.indicatorColor,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        S.of(context).tapToViewInfo,
                        textAlign: TextAlign.right,
                        style: AppTextStyle.s13w400.copyWith(
                          color: theme.hintColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(
                      AppAssets.images.mapStarted,
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        S.of(context).departure.toUpperCase(),
                        style: AppTextStyle.s10w600.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      data.departure ?? '',
                      style: AppTextStyle.s13w400.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Image.asset(AppAssets.images.mapPasteX2),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        S.of(context).destination.toUpperCase(),
                        style: AppTextStyle.s10w600.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      data.destenation ?? '',
                      style: AppTextStyle.s13w400.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    SvgPicture.asset(AppAssets.svg.location),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        S.of(context).currentLocation.toUpperCase(),
                        style: AppTextStyle.s10w600.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      data.location?.location ?? '',
                      style: AppTextStyle.s13w400.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
