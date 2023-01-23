import 'package:colos/constants/app_text_styles.dart';
import 'package:colos/constants/assets.dart';
import 'package:colos/core/router/router.dart';
import 'package:colos/models/shipments_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future<T?> showRoutesBottomSheet<T>({
  required BuildContext context,
  required ShipmentsRouteWithLocationEntity route,
}) =>
    AppRouter.showBottomSheet<T?>(
      context: context,
      isScrollControlled: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (context) {
        return ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          itemCount: route.routes?.length ?? 0,
          itemBuilder: (contet, i) {
            return Row(
              children: [
                Text(route.routes?[i].pointOfDeparture ?? '', style: AppTextStyle.s14w700),
                const SizedBox(width: 10),
                SvgPicture.asset(AppAssets.svg.arrowNext),
                const SizedBox(width: 10),
                Text(route.routes?[i].pointOfArrival ?? ''),
              ],
            );
          },
          separatorBuilder: (context, i) => const SizedBox(height: 10),
        );
      },
    );
