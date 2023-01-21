import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';

class BaseUi extends StatelessWidget {
  final List<Widget> children;
  final bool? allowBackButton;
  final bool? allowScrolling;
  final bool? safeTop;
  final Function? onRefreshFunction;
  final PreferredSizeWidget? appBar;
  final PreferredSizeWidget? sliverAppBar_;
  const BaseUi(
      {Key? key,
      this.allowBackButton,
      required this.children,
      required this.allowScrolling,
      this.safeTop,
      this.appBar,
      this.sliverAppBar_,
      this.onRefreshFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
        viewModelBuilder: () => BaseModel(),
        onModelReady: (model) async {},
        disposeViewModel: false,
        builder: (context, model, child) => WillPopScope(
            onWillPop: () async {
              return allowBackButton ?? true;
            },
            child: KeyboardDismisser(
              gestures: const [
                GestureType.onTap,
                // GestureType.onPanUpdateDownDirection
              ],
              child: RefreshIndicator(
                displacement: 100,
                backgroundColor: blue,
                color: white,
                strokeWidth: 3,
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                onRefresh: () async {
                  if (onRefreshFunction != null) {
                    return onRefreshFunction!();
                  }
                },
                child: Scaffold(
                  body: SafeArea(
                    bottom: false,
                    top: safeTop ?? false,
                    child: allowScrolling == true
                        ? CustomScrollView(
                            slivers: [
                              const sliverAppBar(),
                              SliverList(
                                delegate: SliverChildListDelegate(
                                  [
                                    Stack(
                                      children: children,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: white,
                            child: Stack(
                              children: children,
                            ),
                          ),
                  ),
                  // appBar: appBar,
                ),
              ),
            )));
  }
}
