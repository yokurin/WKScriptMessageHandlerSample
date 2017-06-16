//
//  ViewController.swift
//  WKScriptMessageHandlerSample
//
//  Created by 林　翼 on 2017/06/16.
//  Copyright © 2017年 Tsubasa Hayashi. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKScriptMessageHandler  {
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config: WKWebViewConfiguration = WKWebViewConfiguration()
        let userController: WKUserContentController = WKUserContentController()
        
        let scriptPath = Bundle.main.path(forResource: "sample", ofType: "js")
        let scriptContent = try! String(contentsOfFile: scriptPath!, encoding: String.Encoding.utf8)
        let userScript = WKUserScript(source: scriptContent, injectionTime: WKUserScriptInjectionTime.atDocumentEnd, forMainFrameOnly: true)
        userController.addUserScript(userScript)
        
        userController.add(self, name: "sample1Handler")
        userController.add(self, name: "sample2Handler")
        config.userContentController = userController;
        
        webView = WKWebView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height), configuration: config)
        self.view.addSubview(webView)
        
        let request = URLRequest(url: URL(string: "https://www.google.co.jp/")!)
        webView.load(request)
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if(message.name == "sample1Handler" || message.name == "sample2Handler") {
            print("JavaScript is sending a message \(message.body)")
        }
    }

}
