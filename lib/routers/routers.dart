import 'package:flutter_boost/flutter_boost.dart';

import 'package:flutter_demo/pages/case/bottom_navigation_bar_demo.dart';
import 'package:flutter_demo/pages/case/flutter_to_flutter_sample.dart';
import 'package:flutter_demo/pages/case/image_pick.dart';
import 'package:flutter_demo/pages/case/media_query.dart';
import 'package:flutter_demo/pages/case/native_view_demo.dart';
import 'package:flutter_demo/pages/case/platform_view_perf.dart';
import 'package:flutter_demo/pages/case/popUntil.dart';
import 'package:flutter_demo/pages/case/return_data.dart';
import 'package:flutter_demo/pages/case/simple_webview_demo.dart';
import 'package:flutter_demo/pages/case/selection_screen.dart';
import 'package:flutter_demo/pages/case/state_restoration.dart';
import 'package:flutter_demo/pages/case/system_ui_overlay_style.dart';
import 'package:flutter_demo/pages/case/transparent_widget.dart';
import 'package:flutter_demo/pages/case/radial_hero_animation.dart';
import 'package:flutter_demo/pages/case/webview_flutter_demo.dart';
import 'package:flutter_demo/pages/case/willpop.dart';
import 'package:flutter_demo/pages/flutter_page.dart';
import 'package:flutter_demo/pages/simple_page_widgets.dart';
import 'package:flutter_demo/pages/tab/simple_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/case/flutter_rebuild_demo.dart';

class Routers{
  static Map<String, FlutterBoostRouteFactory> routerMap = {
    // '/': (settings, uniqueId) {
    //   return PageRouteBuilder<dynamic>(
    //       settings: settings, pageBuilder: (_, __, ___) => Container());
    // },
    'embedded': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => EmbeddedFirstRouteWidget());
    },
    'presentFlutterPage': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => FlutterRouteWidget(
            params: settings.arguments,
            uniqueId: uniqueId,
          ));
    },
    'imagepick': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => ImagePickerPage(title: "xxx"));
    },
    'interceptor': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => ImagePickerPage(title: "interceptor"));
    },
    'firstFirst': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => FirstFirstRouteWidget());
    },
    'willPop': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => WillPopRoute());
    },
    'returnData': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => ReturnDataWidget());
    },
    'transparentWidget': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          barrierColor: Colors.black12,
          transitionDuration: const Duration(),
          reverseTransitionDuration: const Duration(),
          opaque: false,
          settings: settings,
          pageBuilder: (_, __, ___) => TransparentWidget());
    },
    'radialExpansion': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => RadialExpansionDemo());
    },
    'selectionScreen': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => SelectionScreen());
    },
    'secondStateful': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => SecondStatefulRouteWidget());
    },
    'platformView': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => PlatformRouteWidget());
    },
    'popUntilView': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => PopUntilRoute());
    },

    ///可以在native层通过 getContainerParams 来传递参数
    'flutterPage': (settings, uniqueId) {
      print('flutterPage1 settings:${settings.arguments}22222, uniqueId:$uniqueId');
      return PageRouteBuilder<dynamic>(
        settings: settings,
        pageBuilder: (_, __, ___) => FlutterRouteWidget(
          params: settings.arguments,
          uniqueId: uniqueId,
        ),
        // transitionsBuilder: (BuildContext context, Animation<double> animation,
        //     Animation<double> secondaryAnimation, Widget child) {
        //   return SlideTransition(
        //     position: Tween<Offset>(
        //       begin: const Offset(1.0, 0),
        //       end: Offset.zero,
        //     ).animate(animation),
        //     child: SlideTransition(
        //       position: Tween<Offset>(
        //         begin: Offset.zero,
        //         end: const Offset(-1.0, 0),
        //       ).animate(secondaryAnimation),
        //       child: child,
        //     ),
        //   );
        // },
      );
    },
    'tab_friend': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => SimpleWidget(
              uniqueId, settings.arguments, "This is a flutter fragment"));
    },
    'tab_message': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => SimpleWidget(
              uniqueId, settings.arguments, "This is a flutter fragment"));
    },
    'tab_flutter1': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => SimpleWidget(
              uniqueId, settings.arguments, "This is a custom FlutterView"));
    },
    'tab_flutter2': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => SimpleWidget(
              uniqueId, settings.arguments, "This is a custom FlutterView"));
    },

    'f2f_first': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => F2FFirstPage());
    },
    'f2f_second': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => F2FSecondPage());
    },
    'webview': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => WebViewExample());
    },
    'platformview/listview': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => PlatformViewPerf());
    },
    'platformview/animation': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => NativeViewExample());
    },
    'platformview/simplewebview': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => SimpleWebView());
    },
    'state_restoration': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => StateRestorationDemo());
    },
    'bottom_navigation': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => BottomNavigationPage());
    },
    'system_ui_overlay_style': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => SystemUiOverlayStyleDemo());
    },
    'mediaquery': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => MediaQueryRouteWidget(
            params: settings.arguments,
            uniqueId: uniqueId,
          ));
    },

    ///使用 BoostCacheWidget包裹你的页面时，可以解决push pageA->pageB->pageC 过程中，pageA，pageB 会多次 rebuild 的问题
    'flutterRebuildDemo': (settings, uniqueId) {
      return MaterialPageRoute(
          settings: settings,
          builder: (ctx) {
            return BoostCacheWidget(
              uniqueId: uniqueId,
              builder: (_) => FlutterRebuildDemo(),
            );
          });
    },
    'flutterRebuildPageA': (settings, uniqueId) {
      return MaterialPageRoute(
          settings: settings,
          builder: (ctx) {
            return BoostCacheWidget(
              uniqueId: uniqueId,
              builder: (_) => FlutterRebuildPageA(),
            );
          });
    },
    'flutterRebuildPageB': (settings, uniqueId) {
      return MaterialPageRoute(
          settings: settings,
          builder: (ctx) {
            return BoostCacheWidget(
              uniqueId: uniqueId,
              builder: (_) => FlutterRebuildPageB(),
            );
          });
    },
  };

  static Route<dynamic> routeFactory(RouteSettings settings, String uniqueId) {
    FlutterBoostRouteFactory? func = routerMap![settings.name];
    return func!(settings, uniqueId);
  }
}