//
//  WebViewController.swift
//  NewsAPI
//
//  Created by Dev on 26/09/2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController{

    @IBOutlet weak var webView: WKWebView!
    
    var urlString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        webView.load(request)
        
    }
    
}
