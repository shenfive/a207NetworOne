//
//  ViewController.swift
//  a207NetworOne
//
//  Created by 申潤五 on 2020/8/15.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var theWeb: WKWebView!
    
    @IBOutlet weak var urlAddTF: UITextField!
    var timer:Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(getNetworkStatus(sender:)), userInfo: nil, repeats: true)
        
        
        openURL(urlString: "www.apple.com")
        
        
        
    }

    func openURL(urlString:String){
        
        let target = "https://" + urlString
        
        if let url = URL(string: target){
            let request = URLRequest(url: url)
            theWeb.load(request)
        }
    }
    
    
    @IBAction func openWeb(_ sender: Any) {
        if let url = urlAddTF.text{
            openURL(urlString: url)
        }
    }
    
    
    
    
    @objc func getNetworkStatus(sender:Any?)->Bool{
        if Reachability(hostName: "www.apple.com")?.currentReachabilityStatus().rawValue == 0 {
            status.text = "沒網路"
            return false
        }else{
            status.text = "有網路"
            return true
        }
    }

}

