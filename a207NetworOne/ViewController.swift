//
//  ViewController.swift
//  a207NetworOne
//
//  Created by 申潤五 on 2020/8/15.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var status: UILabel!
    
    var timer:Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(getNetworkStatus(sender:)), userInfo: nil, repeats: true)
        
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

