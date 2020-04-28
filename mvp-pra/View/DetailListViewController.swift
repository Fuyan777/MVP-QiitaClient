//
//  DetailListViewController.swift
//  mvp-pra
//
//  Created by 山田楓也 on 2020/04/12.
//  Copyright © 2020 Fuuya Yamada. All rights reserved.
//

import UIKit
import WebKit

final class DetailListViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        openUrl(urlString: self.url)
        webView.navigationDelegate = self
    }
}

extension DetailListViewController: WKNavigationDelegate {
    func openUrl(urlString: String) {
        let url = URL(string: urlString)
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
    }
}
