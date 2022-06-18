import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_app/presentation/main/pages/home/view/widgets/custom_article.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../app/di.dart';
import '../../../../../domain/model/main_models.dart';
import '../../../../common/state_renderer/state_renderer_impl.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/routes_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/values_manager.dart';
import '../viewmodel/home_viewmodel.dart';
import 'widgets/custom_banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _viewModel = instance<HomeViewModel>();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _viewModel.start();
                }) ??
                _getContentWidget();
          }),
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<HomeViewObject>(
        stream: _viewModel.outputHomeData,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getBannerWidget(snapshot.data?.banners),
              _getSection(AppStrings.needADoctor.tr()),
              _getNeedDoctorWidget(),
              _getSection(AppStrings.latestArticles.tr()),
              _getLatestArticlesWidget(snapshot.data?.articles),
            ],
          );
        });
  }

  Widget _getBannerWidget(List<BannerAd>? banners) {
    if (banners != null) {
      return SizedBox(
        height: AppSize.s190,
        width: double.infinity,
        child: CarouselSlider(
            items: banners.map((banner) => CustomBanner(banner)).toList(),
            options: CarouselOptions(
                padEnds: false,
                autoPlay: true,
                enableInfiniteScroll: true,
                enlargeCenterPage: true)),
      );
    } else {
      return Container();
    }
  }

  Widget _getSection(String title) {
    return Padding(
        padding: const EdgeInsets.only(
            top: AppPadding.p12,
            left: AppPadding.p12,
            right: AppPadding.p12,
            bottom: AppPadding.p2),
        child: Text(title, style: Theme.of(context).textTheme.titleLarge));
  }

  Widget _getNeedDoctorWidget() {
    return Padding(
        padding: const EdgeInsets.only(
            left: AppPadding.p12, right: AppPadding.p12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.bookOnlineOrHelp.tr()),
            const SizedBox(height: AppSize.s8),
            Container(
              color: ColorManager.lightBlueGrey,
              child: ListTile(
                  leading: Icon(Icons.meeting_room_outlined,
                      color: ColorManager.primary),
                  title: Text(AppStrings.bookAppointmentTitle.tr()),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(Routes.bookingRoute);
                  }),
            ),
          ],
        ));
  }

  Widget _getLatestArticlesWidget(List<Article>? articles) {
    if (articles != null) {
      return Container(
        padding:
            const EdgeInsets.only(left: AppPadding.p12, right: AppPadding.p12),
        child: GridView.count(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            children:
                articles.map((article) => CustomArticle(article)).toList()),
      );
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
