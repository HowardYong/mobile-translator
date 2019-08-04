//
//  DataSession.swift
//  spark_ver_0.0.1
//
//  Created by Howard Yong on 4/19/19.
//  Copyright © 2019 Howard Yong. All rights reserved.
//

import Foundation

protocol FinanceNewsProtocol
{
    func responseDataHandler(data:NSDictionary)
    func responseError(message:String)
}

class DataSession {
    private let urlSession = URLSession.shared
    private let urlPathBase = "https://newsapi.org/v2/top-headlines?"
    
    private var dataTask:URLSessionDataTask? = nil
    
    var delegate:FinanceNewsProtocol? = nil
    
    init() {}
    
    func getData(exampleDataNumber:String) {
        
        var urlPath = self.urlPathBase
        urlPath = urlPath + exampleDataNumber
        
        let url:NSURL? = NSURL(string: urlPath)
        
        let dataTask = self.urlSession.dataTask(with: url! as URL) { (data, response, error) -> Void in
            if error != nil {
                print(error!)
            } else {
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                    if jsonResult != nil {
                        //print(jsonResult)
                        let title: String? = jsonResult!["title"] as? String
                        let body: String? = jsonResult!["body"] as? String
                        if title != nil && body != nil {
                            self.delegate?.responseDataHandler(data: jsonResult!)
                        } else {
                            self.delegate?.responseError(message: "Fake data not found")
                        }
                    }
                } catch {
                    //Catch and handle the exception
                }
            }
        }
        dataTask.resume()
    }
}
