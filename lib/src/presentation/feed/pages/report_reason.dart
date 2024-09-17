import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/report_radio.dart';

class ReportReason extends StatefulWidget {
  const ReportReason({super.key});

  @override
  State<ReportReason> createState() => _ReportReasonState();
}

class _ReportReasonState extends State<ReportReason> {
  String groupValue = "none";

  void onChanged(String value) {
    setState(() {
      groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String username = GoRouterState.of(context).extra as String;
    List<ReportRadioModel> reportRadio = [
      ReportRadioModel(
          label: "Hate",
          description:
              "Slurs, Racist or sexist stereotypes, Dehumanization, Incitement of fear or discrimination, Hateful references, Hateful symbols & logos .",
          groupValue: groupValue,
          value: "hate",
          onChanged: onChanged),
      ReportRadioModel(
          label: "Abuse & Harassment",
          description:
              "Insult, Unwanted Sexual Content & Graphic Objectification, Unwanted NSFW Graphic content, Violent Event Denial, Targeted Harassment and Inciting Harassment .",
          groupValue: groupValue,
          value: "abuse",
          onChanged: onChanged),
      ReportRadioModel(
          label: "Violent Speech",
          description:
              "Violent Threats, Wish of Harm, Glorification of Violence, Incitement of Violence, Coded Incitement of Violence.",
          groupValue: groupValue,
          value: "violent",
          onChanged: onChanged),
      ReportRadioModel(
          label: "Pornography",
          description:
              "Slurs, Racist or sexist stereotypes, Dehumanization, Incitement of fear or discrimination, Hateful references, Hateful symbols & logos.",
          groupValue: groupValue,
          value: "pornograhy",
          onChanged: onChanged),
      ReportRadioModel(
          label: "Child Safety",
          description:
              "Child sexual exploitation, grooming, physical child abuse, underage user .",
          groupValue: groupValue,
          value: "child",
          onChanged: onChanged),
      ReportRadioModel(
          label: "Privacy",
          description:
              "Sharing private information, threatening to share/expose private information, sharing non-consensual intimate images, sharing images of me that i dont want on the platform.",
          groupValue: groupValue,
          value: "privacy",
          onChanged: onChanged),
      ReportRadioModel(
          label: "Spam",
          description:
              "Fake engagement, scams, fake accounts, malicious links.",
          groupValue: groupValue,
          value: "spam",
          onChanged: onChanged),
      ReportRadioModel(
          label: "Suicide or self-harm",
          description:
              "Encouraging, promoting, providing instructions or sharing strategies for self-harm.",
          groupValue: groupValue,
          value: "suicide",
          onChanged: onChanged),
      ReportRadioModel(
          label: "Sensitive or disturbing media",
          description:
              "Graphic content, Gratuitous Gore, Adult Nudity & Sexual Behavior, Violent Sexual Conduct, Bestiality & Necrophilia, Media depicting a deceased individual.",
          groupValue: groupValue,
          value: "sensitive",
          onChanged: onChanged),
      ReportRadioModel(
          label: "Impersonation",
          description:
              "Pretending to be someone else, including, non-compliant parody/fan accounts.",
          groupValue: groupValue,
          value: "impersonation",
          onChanged: onChanged),
      ReportRadioModel(
          label: "Violent & hateful entities",
          description:
              "Violent extremism and terrorism, hate groups & networks.",
          groupValue: groupValue,
          value: "entities",
          onChanged: onChanged),
    ];

    return Scaffold(
      body: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 21),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style:
                          subtitleProximaNovaTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 26,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 34),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tell us what happened",
                      style:
                          subtitleProximaNovaTextStyle.copyWith(fontSize: 26),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "What specific type of issue are you reporting to us right now?",
                      style: regularSegoeUITextStyle.copyWith(fontSize: 15),
                    ),
                    SizedBox(
                      height: 34,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: reportRadio.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 22,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ReportRadio(
                          data: reportRadio[index],
                        );
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: groupValue == "none"
                                ? null
                                : () {
                                    context.pushReplacementNamed(
                                        "report-continue",
                                        extra: username);
                                  },
                            child: Text(
                              "Next",
                              style: titleProximaNovaTextStyle.copyWith(
                                  fontSize: 15, color: boxColor),
                            ))),
                    SizedBox(
                      height: 22,
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
