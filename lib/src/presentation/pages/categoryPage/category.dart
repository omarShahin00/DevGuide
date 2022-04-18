import 'package:dev_guide/src/core/routes_name.dart';
import 'package:dev_guide/src/presentation/resources/color_manager.dart';
import 'package:dev_guide/src/presentation/resources/styles_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:dev_guide/src/presentation/widget/image_view.dart';
import 'package:flutter/material.dart';

class CategroyPage extends StatefulWidget {
  const CategroyPage({Key? key}) : super(key: key);

  @override
  State<CategroyPage> createState() => _CategroyPageState();
}

class _CategroyPageState extends State<CategroyPage>
    with AutomaticKeepAliveClientMixin {
  late ThemeData _theme;

  final List<Map> _categoryDemoData = [
    {
      "name": "Development",
      "image":
          "https://img.icons8.com/external-flatart-icons-flat-flatarticons/2x/external-development-web-design-and-development-flatart-icons-flat-flatarticons-2.png",
      "state": ""
    },
    {
      "name": "IT & Software",
      "image":
          "https://cdn.icon-icons.com/icons2/1859/PNG/512/codinghtml_117947.png",
      "state": "Upcoming"
    },
    {
      "name": "Design",
      "image":
          "https://cdn.icon-icons.com/icons2/664/PNG/512/construction_project_plan_building_architect_design_develop-62_icon-icons.com_60212.png",
      "state": "Upcoming"
    },
    {
      "name": "E-Business",
      "image":
          "https://cdn.icon-icons.com/icons2/1153/PNG/512/1486564180-finance-financial-report_81493.png",
      "state": "Upcoming"
    },
    {
      "name": "Marketing",
      "image":
          "https://cdn.icon-icons.com/icons2/1881/PNG/512/iconfinder-social-media-work-4341270_120574.png",
      "state": "Upcoming"
    },
    {
      "name": "Personl Development",
      "image":
          "https://cdn.icon-icons.com/icons2/1537/PNG/512/1562687-code-computer-creative-html-process-technology-web-development_107058.png",
      "state": "Upcoming"
    },
    {
      "name": "Photography & Video",
      "image":
          "https://cdn.icon-icons.com/icons2/1461/PNG/512/2998131-camera-photo-photography_99870.png",
      "state": "Upcoming"
    },
    {
      "name": "Office & Produtivity",
      "image":
          "https://img.icons8.com/external-parzival-1997-outline-color-parzival-1997/2x/external-productivity-technology-in-daily-life-parzival-1997-outline-color-parzival-1997.png",
      "state": "Upcoming"
    },
  ];

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSize.s18),
              child: Text(
                'Category',
                style: _theme.textTheme.labelMedium,
              ),
            ),
            _categoryView(),
          ],
        ),
      ),
    );
  }

  Widget _categoryView() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => _categoryItemView(
          _categoryDemoData[index],
        ),
        itemCount: _categoryDemoData.length,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }

  Widget _categoryItemView(
    Map categoryDemoDate,
  ) {
    return InkWell(
      onTap: () {
        if (categoryDemoDate["state"].toString().isEmpty) {
          Navigator.pushNamed(context, RoutesName.subCategory,
              arguments: {"category": categoryDemoDate});
        }
      },
      child: ListTile(
        leading: ImageView(
          url: categoryDemoDate["image"],
          width: AppSize.s28,
          height: AppSize.s28,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                categoryDemoDate["name"],
                style: _theme.textTheme.caption,
              ),
            ),
            const SizedBox(
              width: AppSize.s8,
            ),
            Text(
              categoryDemoDate["state"],
              style: getLightStyle(
                color: ColorManager.grey,
              ),
            ),
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: ColorManager.black,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
