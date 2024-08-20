import 'package:flutter/material.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';

class ReportRadioModel {
  final String label;
  final String description;
  final String groupValue;
  final String value;
  final ValueChanged<String> onChanged;

  ReportRadioModel(
      {required this.label,
      required this.description,
      required this.groupValue,
      required this.value,
      required this.onChanged});
}

class ReportRadio extends StatelessWidget {
  const ReportRadio({
    super.key,
    required this.data,
  });

  final ReportRadioModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (data.value != data.groupValue) {
          data.onChanged(data.value);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.label,
                  style: titleSegoeUITextStyle.copyWith(fontSize: 16),
                ),
                Text(
                  data.description,
                  style: regularSegoeUITextStyle.copyWith(
                      fontSize: 14, color: thirdColor),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 24,
          ),
          Radio<String>(
            fillColor: WidgetStatePropertyAll(thirdColor),
            groupValue: data.groupValue,
            value: data.value,
            onChanged: (String? newValue) {
              data.onChanged(newValue!);
            },
          ),
        ],
      ),
    );
  }
}
