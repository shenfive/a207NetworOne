//
//  ViewController.swift
//  a207NetworOne
//
//  Created by 申潤五 on 2020/8/15.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKUIDelegate {

    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var theWeb: WKWebView!
    
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var urlAddTF: UITextField!
    var timer:Timer? = nil
    @IBOutlet weak var preBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(getNetworkStatus(sender:)), userInfo: nil, repeats: true)
        
        openURL(urlString: "www.apple.com")
        goButton.isEnabled = false
        
        
    }

    func openURL(urlString:String){
//        if getNetworkStatus(sender: nil) == true {
            let target = "https://" + urlString
            
            if let url = URL(string: target){
                let request = URLRequest(url: url)
                theWeb.load(request)
            }
            return
//        }else{
//            let alert = UIAlertController(title: "網路不穩", message: "請確認再試", preferredStyle: .alert)
//            let action = UIAlertAction(title: "知道了", style: .default, handler: nil  )
//            alert.addAction(action)
//            present(alert, animated: true, completion: nil)
//        }
        
        

    }
    
    
    @IBAction func openWeb(_ sender: Any) {
        if let url = urlAddTF.text{
            openURL(urlString: url)
        }
    }
    
    @IBAction func goPrePage(_ sender: Any) {
        theWeb.goBack()
    }
    
    @IBAction func goNextPage(_ sender: Any) {
        theWeb.goForward()
    }
    
    
    @objc func getNetworkStatus(sender:Any?)->Bool{
        
        if theWeb.isLoading == true{
            print("web status : isLoading")
        }else{
            print("web status: finished")
        }
        
//        if theWeb.canGoBack == true{
//            preBtn.isEnabled = true
//        }
        
        preBtn.isEnabled = theWeb.canGoBack
        nextBtn.isEnabled = theWeb.canGoForward
        
        
        
        
        if Reachability(hostName: "www.apple.com")?.currentReachabilityStatus().rawValue == 0 {
            goButton.isEnabled = false
            if status.text != "沒網路"{
                let alert = UIAlertController(title: "網路不穩", message: "請確認再試", preferredStyle: .alert)
                let action = UIAlertAction(title: "知道了", style: .default, handler: nil  )
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }
            status.text = "沒網路"
            return false
        }else{
            goButton.isEnabled = true
            status.text = "有網路"
            return true
        }
        

        
        
        
    }

}

