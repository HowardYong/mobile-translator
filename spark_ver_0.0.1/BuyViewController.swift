//
//  BuyViewController.swift
//  spark_ver_0.0.1
//
//  Created by Howard Yong on 4/25/19.
//  Copyright © 2019 Howard Yong. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController {

    @IBOutlet weak var numRecsTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "buyToHome" {
            
        }
    }
    

}
