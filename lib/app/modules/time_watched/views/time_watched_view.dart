import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_screens/app/shared/widgets/appbar.dart';

import '../../../../gen/colors.gen.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/extensions/num_extension.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../../../shared/widgets/common.dart';
import '../controllers/time_watched_controller.dart';

class TimeWatchedView extends GetView<TimeWatchedController> {
  const TimeWatchedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarTitleActionBack(
          title: "Time watched",
          onBack: () => Get.back(),
        ),
      ),
      body: NoScrollBarWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BarChart(),
            _WatchDetail(),
            divider(),
            _ToolsManagerTime(),
          ].separateCenter(),
        ),
      ),
    );
  }
}

class _WatchDetail extends GetView<TimeWatchedController> {
  const _WatchDetail();

  @override
  Widget build(BuildContext context) {
    final leadingStyle = context.textTheme.bodyLarge;
    final trailingStyle = context.textTheme.bodyMedium;
    final bodySmall = context.textTheme.bodySmall;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text("Today", style: leadingStyle),
          trailing: Text(
            "${controller.todayWatch.value.minutesToHHMM()}",
            style: trailingStyle,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.normal),
        ),
        ListTile(
          title: Text("Last 7 days", style: leadingStyle),
          trailing: Text(
            "${controller.last7Days().minutesToHHMM()}",
            style: trailingStyle,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.normal),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.normal),
          child: Text.rich(TextSpan(text: "Stats are base on your ", style: bodySmall, children: [
            TextSpan(
              text: 'watch history',
              recognizer: TapGestureRecognizer()..onTap = () {},
              style: bodySmall!.copyWith(
                color: context.theme.primaryColor,
              ),
            ),
            TextSpan(text: ' across YouTube products (expect YouTube Music and YouTube TV).\n', style: bodySmall),
            TextSpan(
              text: 'Learn more',
              recognizer: TapGestureRecognizer()..onTap = () {},
              style: bodySmall.copyWith(
                color: context.theme.primaryColor,
              ),
            ),
          ])),
        ),
      ],
    );
  }
}

class _ToolsManagerTime extends GetView<TimeWatchedController> {
  const _ToolsManagerTime();

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.textTheme.bodyLarge;
    final subtitleStyle = context.textTheme.bodyMedium;
    return Obx(() => Container(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.normal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tools to manager your YouTube time",
                style: titleStyle!.copyWith(fontSize: 18),
              ),
              SwitchListTile(
                value: controller.remindBreak.value,
                contentPadding: EdgeInsets.zero,
                onChanged: controller.changeRemindBreak,
                title: Text("Remind me to take a break", style: titleStyle),
                subtitle: Text("Every 1 hour 30 minutes", style: subtitleStyle),
              ),
              SwitchListTile(
                value: controller.remindBed.value,
                contentPadding: EdgeInsets.zero,
                onChanged: controller.changeRemindBed,
                title: Text("Remind me when it's bedtime", style: titleStyle),
                subtitle: Text(
                  controller.remindBed.value ? "On" : "Off",
                  style: subtitleStyle,
                ),
              ),
              SwitchListTile(
                value: controller.autoPlayMobileAndTablet.value,
                contentPadding: EdgeInsets.zero,
                onChanged: controller.changeAutoPlay,
                title: Text("Autoplay on mobile/table", style: titleStyle),
                subtitle: Text(
                  "When you finish a video, another plays automatically",
                  style: subtitleStyle,
                ),
              ),
            ].separateCenter(),
          ),
        ));
  }
}

class _BarChart extends StatefulWidget {
  const _BarChart();

  @override
  State<StatefulWidget> createState() => _BarChartState();
}

class _BarChartState extends State<_BarChart> {
  final controller = Get.find<TimeWatchedController>();

  @override
  void initState() {
    super.initState();
    controller.loadWatchMinute();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: Obx(
        () => BarChart(
          BarChartData(
            barTouchData: _barTouchData,
            titlesData: _titlesData,
            groupsSpace: ChartSize.chartBarWidth,
            borderData: FlBorderData(show: false),
            barGroups: _barGroups,
            gridData: const FlGridData(show: false),
            alignment: BarChartAlignment.spaceAround,
            maxY: controller.maxHour.value * 60, // 10 hour
          ),
        ),
      ),
    );
  }

  BarTouchData get _barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().minutesToHHMM(),
              const TextStyle(
                color: ColorName.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(
        value.toInt().toDayOfWeek(),
        style: Get.context!.textTheme.bodyLarge,
      ),
    );
  }

  FlTitlesData get _titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true, getTitlesWidget: getTitles),
        ),
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      );

  List<BarChartGroupData> get _barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: controller.watchMinute[0],
              borderRadius: BorderRadius.circular(ChartSize.chartBarRadius),
              width: ChartSize.chartBarWidth,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: controller.watchMinute[1],
              borderRadius: BorderRadius.circular(ChartSize.chartBarRadius),
              width: ChartSize.chartBarWidth,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: controller.watchMinute[2],
              borderRadius: BorderRadius.circular(ChartSize.chartBarRadius),
              width: ChartSize.chartBarWidth,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: controller.watchMinute[3],
              borderRadius: BorderRadius.circular(ChartSize.chartBarRadius),
              width: ChartSize.chartBarWidth,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: controller.watchMinute[4],
              borderRadius: BorderRadius.circular(ChartSize.chartBarRadius),
              width: ChartSize.chartBarWidth,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              toY: controller.watchMinute[5],
              borderRadius: BorderRadius.circular(ChartSize.chartBarRadius),
              width: ChartSize.chartBarWidth,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
              toY: controller.watchMinute[6],
              borderRadius: BorderRadius.circular(ChartSize.chartBarRadius),
              width: ChartSize.chartBarWidth,
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}
