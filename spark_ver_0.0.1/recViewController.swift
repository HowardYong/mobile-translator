//
//  recViewController.swift
//  spark_ver_0.0.1
//
//  Created by Howard Yong on 4/23/19.
//  Copyright © 2019 Howard Yong. All rights reserved.
//

import UIKit

class recViewController: UIViewController {

    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var fuel: UIImageView!
    @IBOutlet weak var averageCost: UILabel!
    @IBOutlet weak var currentEquity: UILabel!
    @IBOutlet weak var serialNum: UILabel!
    @IBOutlet weak var expDate: UILabel!
    @IBOutlet weak var generator: UILabel!
    
    var stateVal: String = ""
    var priceVal: Double = 0.0
    var fuelVal: String = ""
    var averageCostVal: Double = 0.0
    var currentEquityVal: Double = 0.0
    var serialNumVal: String = ""
    var expDateVal: String = ""
    var generatorVal: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(priceVal)
        navigationController?.setNavigationBarHidden(false, animated: true)
        state.text = stateVal
        price.text = "$\(String(format: "%.2f", priceVal))"
        fuel.image = UIImage(named: fuelVal)
        averageCost.text = "$\(String(format: "%.2f", averageCostVal))"
        currentEquity.text = "$\(String(format: "%.2f", currentEquityVal))"
        serialNum.text = serialNumVal
        expDate.text = expDateVal
        generator.text = generatorVal
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "buyRec" {
            
        }
        
        else if segue.identifier == "sellRec" {
            navigationController?.setNavigationBarHidden(false, animated: true)
            let vc = segue.destination as? SellViewController
            vc?.avgPriceVal = priceVal
        }
    }
    

}
