//
//  ViewController.swift
//  parking-test-http
//
//  Created by Ertheo Siswadi on 11/17/18.
//  Copyright © 2018 Ertheo Siswadi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let apihelper = APIHelper.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        apihelper.getRequest { (data) in
            print(data["gayley"]![0])
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

