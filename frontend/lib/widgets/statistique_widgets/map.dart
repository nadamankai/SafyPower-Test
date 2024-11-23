import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';

class MapPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
     final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 600;
    return 
    !isMobile
        ?
         HtmlWidget(
                '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2624.9521988889637!2d2.3661117!3d48.8591219!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e66e0093d73403%3A0x32934e2cb56c6265!2s8%20Rue%20du%20Grand%20Veneur%2C%2075003%20Paris%2C%20France!5e0!3m2!1sfr!2stn!4v1719238352400!5m2!1sfr!2stn" width="800" height="600" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>',
                factoryBuilder: () => MyWidgetFactory(),
              
              ):
               HtmlWidget(
                '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2624.9521988889637!2d2.3661117!3d48.8591219!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e66e0093d73403%3A0x32934e2cb56c6265!2s8%20Rue%20du%20Grand%20Veneur%2C%2075003%20Paris%2C%20France!5e0!3m2!1sfr!2stn!4v1719238352400!5m2!1sfr!2stn" width="600" height="250" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>',
                factoryBuilder: () => MyWidgetFactory(),
              
              );
    
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {}
