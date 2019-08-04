//
//  SellViewController.swift
//  
//
//  Created by Howard Yong on 4/25/19.
//

import UIKit

class SellViewController: UIViewController {

    @IBOutlet weak var numRecsTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var avgTradingPriceLabel: UILabel!
    var avgPriceVal: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let str1 = String(avgPriceVal)
        print(str1)
        // Do any additional setup after loading the view.
        avgTradingPriceLabel.text = "$\(String(format: "%.2f", avgPriceVal))"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
