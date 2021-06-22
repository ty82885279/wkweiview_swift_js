//
//  ViewController.swift
//  wkweiview_swift_js
//
//  Created by lee on 2021/3/7.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
//        print("收到js的消息")
       if message.name == "closeMsg" {
            print("关闭页面")
       }else if message.name == "getTokenMsg"{
           print("获取原生token")
           //getTokenFromIOS
        let token = "token1233565677"
        let jsStr = String(format:"getTokenFromIOS('%@')",token)
        DispatchQueue.main.async {
                //code
            self.web.evaluateJavaScript(jsStr as String, completionHandler: { (result:Any?, error:Error?) in
                   print("error:",error as Any)
             })
            }
       }else if message.name == "test"{
        print("测试消息")
        print(message.body)
       }
    }
    var web:WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //初始化WKWebViewConfiguration
        let webConfiguration = WKWebViewConfiguration()
        let userContentController = WKUserContentController()
        webConfiguration.userContentController = userContentController
        webConfiguration.preferences.javaScriptEnabled = true

        let frame = self.view.bounds
        //JS调用Swift
        userContentController.add(self, name: "closeMsg")
        userContentController.add(self, name: "getTokenMsg")
        userContentController.add(self, name: "test")

        self.web = WKWebView(frame: frame, configuration: webConfiguration)
        self.web.uiDelegate = self
        self.web.navigationDelegate = self
       // self.web.scrollView.isScrollEnabled = false
        self.web.scrollView.showsVerticalScrollIndicator = false
        self.web.scrollView.showsHorizontalScrollIndicator = false
       // let web_url = URL.init(string: ApiConstants.APP_PROTOCOL)
       // let web_url = URL.init(string: "https://www.baidu.com")
//        let myRequest = URLRequest(url: web_url!)
//        self.web.load(myRequest)
//        let fileURL =  Bundle.main.url(forResource: "index", withExtension: "html" )
//        self.web.loadFileURL(fileURL!,allowingReadAccessTo:Bundle.main.bundleURL);
        
        
        let web_url = URL.init(string:"http://0.0.0.0:8888/#/xxx/zzz")
        let myRequest = URLRequest(url: web_url!)
        self.web.load(myRequest)
//        self.view.addSubview(self.web)
        
        self.view.addSubview(self.web)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {

    }
    
}
