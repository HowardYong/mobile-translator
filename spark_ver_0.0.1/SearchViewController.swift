//
//  SearchViewController.swift
//  spark_ver_0.0.1
//
//  Created by Howard Yong on 4/15/19.
//  Copyright © 2019 Howard Yong. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, FinanceNewsProtocol {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var newsTableView: UITableView!
    
    var dataSession = DataSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.dataSession.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
    }
    
    func responseDataHandler(data:NSDictionary) {
        
        //Run this handling on a separate thread
        DispatchQueue.main.async() {
        }
    }
    
    
    func responseError(message:String) {
        //Run this handling on a separate thread
        DispatchQueue.main.async() {
        }
    }
    
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
}
