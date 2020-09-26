//
//  WebBrowser.swift
//  Sculpt
//
//  Created by Arpit on 9/27/20.
//  Copyright © 2020 Dev Abhi. All rights reserved.
//

import WebKit

class WebBrowser : UIViewController {
    var fileName : String!
    @IBOutlet var webView: WKWebView!
    @IBOutlet var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.uiDelegate = self
        self.webView.navigationDelegate = self
        
        let n = fileName.components(separatedBy:".")
        titleLabel.text = n.first
        let url = Bundle.main.url(forResource: n.first, withExtension: n.last)!
        self.webView.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        self.webView.load(request)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func closeButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension WebBrowser : WKUIDelegate {
    
}

extension WebBrowser : WKNavigationDelegate {
    
}
