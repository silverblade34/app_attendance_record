import 'package:app_attendance_record/app/data/models/home/sections_today.dart';
import 'package:app_attendance_record/app/ui/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

const kTileHeight = 70.0;

// ignore: must_be_immutable
class TimeLineSections extends StatelessWidget {
  List<SectionsToday> dataSectionsToday;

  TimeLineSections({super.key, required this.dataSectionsToday});

  @override
  Widget build(BuildContext context) {
    List<_TimelineStatus> data = dataSectionsToday.map((section) {
      return section.state == 1
          ? _TimelineStatus.inProgress
          : _TimelineStatus.done;
    }).toList();

    return Flexible(
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          color: const Color(0xffc2c5c9),
          connectorTheme: const ConnectorThemeData(
            thickness: 3.0,
          ),
        ),
        padding: const EdgeInsets.only(top: 10.0),
        builder: TimelineTileBuilder.connected(
          indicatorBuilder: (context, index) {
            return DotIndicator(
              color: data[index].isInProgress ? Color(0xff193fcc) : null,
            );
          },
          connectorBuilder: (_, index, connectorType) {
            var color;
            if (index == data.length - 1) {
              color = data[index].isInProgress && data[index + 1].isInProgress
                  ? Color(0xff193fcc)
                  : null;
            }
            return SolidLineConnector(
              indent: connectorType == ConnectorType.start ? 0 : 2.0,
              endIndent: connectorType == ConnectorType.end ? 0 : 2.0,
              color: color,
            );
          },
          contentsBuilder: (context, index) =>
              _EmptyContents(section: dataSectionsToday[index]),
          itemExtentBuilder: (_, __) {
            return kTileHeight;
          },
          itemCount: data.length,
        ),
      ),
    );
  }
}

class _EmptyContents extends StatelessWidget {
  SectionsToday section;

  _EmptyContents({required this.section});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, top: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    section.title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: GREY_LIGHT,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.schedule,
                    size: 16,
                    color: TEXT_LIGHT,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    section.schedule,
                    style: const TextStyle(
                      color: TEXT_LIGHT,
                    ),
                  ),
                ],
              )
            ],
          ),
          InkWell(
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: PRIMARY, borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Colors.white,
              ),
            ),
            onTap: () {
              print("Ir a más detalles ${section.id}");
            },
          )
        ],
      ),
    );
  }
}

enum _TimelineStatus {
  done,
  inProgress,
}

extension on _TimelineStatus {
  bool get isInProgress => this == _TimelineStatus.inProgress;
}
