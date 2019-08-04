//
//  PortfolioViewController.swift
//  spark_ver_0.0.1
//
//  Created by Howard Yong on 4/15/19.
//  Copyright © 2019 Howard Yong. All rights reserved.
//

import UIKit
import Charts
var numbers: [Double] = [562.25, 505.25, 496.39, 491.68, 490.13, 492.86, 484.32, 495.36, 492.46, 491.96, 502.18, 508.62, 497.91, 510.67, 503.68, 516.42, 539.99, 573.87, 552.66]

class TappableLineChartView: LineChartView {
    
    public override init(frame: CGRect)
    {
        super.init(frame: frame)
        addTapRecognizer()
    }
    
    public required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        addTapRecognizer()
    }
    
    func addTapRecognizer() {
        let tapRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chartTapped))
        tapRecognizer.minimumPressDuration = 0.1
        self.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func chartTapped(_ sender: UITapGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            // show
            let position = sender.location(in: self)
            let highlight = self.getHighlightByTouchPoint(position)
            let dataSet = self.getDataSetByTouchPoint(point: position)
            dataSet?.drawValuesEnabled = true
            highlightValue(highlight)
        } else {
            // hide
            data?.dataSets.forEach{ $0.drawValuesEnabled = false }
            highlightValue(nil)
        }
    }
}


class PortfolioViewController: UIViewController {
    
    @IBOutlet weak var chart: TappableLineChartView!
    @IBOutlet weak var portfolioValue: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        updateGraph()
        
        recTableData = [
            recData(state: "Texas", fuel: "solar", price: getPrice(currEquity: 24.78), avgCost: 2.13, currEquity: 24.78, serialNum: getSerial(), expDate: "4/27/2020", generator: "Johnson Home"),
            recData(state: "California", fuel: "solar", price: getPrice(currEquity: 57.10), avgCost: 13.56, currEquity: 57.10, serialNum: getSerial(), expDate: "4/27/2020", generator: "Abbott Home"),
            recData(state: "Massachusetts", fuel: "solar", price: getPrice(currEquity: 46.35), avgCost: 11.16, currEquity: 46.35, serialNum: getSerial(), expDate: "4/27/2020", generator: "Astro Inc."),
            recData(state: "Massachusetts", fuel: "biofuels", price: getPrice(currEquity: 48.67), avgCost: 15.78, currEquity: 48.67, serialNum: getSerial(), expDate: "4/27/2020", generator: "Bell Residents"),
            recData(state: "New Jersey", fuel: "wind", price: getPrice(currEquity: 51.08), avgCost: 6.54, currEquity: 51.08, serialNum: getSerial(), expDate: "4/27/2020", generator: "Bechtel Energy"),
            recData(state: "Texas", fuel: "wind", price: getPrice(currEquity: 26.84), avgCost: 2.61, currEquity: 26.84, serialNum: getSerial(), expDate: "4/27/2020", generator: "Anello"),
            recData(state: "New Jersey", fuel: "solar", price: getPrice(currEquity: 44.81), avgCost: 5.79, currEquity: 44.81, serialNum: getSerial(), expDate: "4/27/2020", generator: "Betty Inc."),
            recData(state: "New Jersey", fuel: "hydro", price: getPrice(currEquity: 43.86), avgCost: 5.79, currEquity: 43.86, serialNum: getSerial(), expDate: "4/27/2020", generator: "Capital Region Water"),
            recData(state: "New Jersey", fuel: "wind", price: getPrice(currEquity: 39.15), avgCost: 6.54, currEquity: 39.15, serialNum: getSerial(), expDate: "4/27/2020", generator: "Cheverolet 21 Inc."),
            recData(state: "California", fuel: "solar", price: getPrice(currEquity: 52.03), avgCost: 14.47, currEquity: 52.03, serialNum: getSerial(), expDate: "4/27/2020", generator: "Control Alt Energy LLC"),
            recData(state: "Ohio", fuel: "solar", price: getPrice(currEquity: 30.14), avgCost: 5.38, currEquity: 30.14, serialNum: getSerial(), expDate: "4/27/2020", generator: "Cincinnati Park Board"),
            recData(state: "Oregon", fuel: "hydro", price: getPrice(currEquity: 28.00), avgCost: 12.34, currEquity: 28.00, serialNum: getSerial(), expDate: "4/27/2020", generator: "Clipper Co"),
            recData(state: "Texas", fuel: "solar", price: getPrice(currEquity: 32.11), avgCost: 3.61, currEquity: 32.11, serialNum: getSerial(), expDate: "4/27/2020", generator: "Coffey"),
            recData(state: "Texas", fuel: "solar", price: getPrice(currEquity: 27.74), avgCost: 3.61, currEquity: 27.74, serialNum: getSerial(), expDate: "4/27/2020", generator: "Electric Corp"),
        ]

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateGraph() {
        var lineChartEntry = [ChartDataEntry]()
        
        for i in 0..<numbers.count {
            let value = ChartDataEntry(x: Double(i), y:numbers[i])
            lineChartEntry.append(value)
        }
        let chartDataSet = LineChartDataSet(values: lineChartEntry, label: "Prices")
        chartDataSet.colors = [NSUIColor.black]
        let data = LineChartData()
        data.addDataSet(chartDataSet)
        chart.data = data
        
        //Setting up colors for line graph and circles
        data.setDrawValues(false)
        let chartColor = UIColor(red:0.42, green:0.75, blue:0.91, alpha:1.0)
        chartDataSet.colors = [chartColor]
        chartDataSet.drawCirclesEnabled = false
        chartDataSet.highlightEnabled = true
        chartDataSet.drawHorizontalHighlightIndicatorEnabled = false
        
        //Setting up Gradient fill
        let gradientColors = [chartColor.cgColor, UIColor.clear.cgColor] as CFArray
        let colorLocations: [CGFloat] = [1.0, 0.0] //position gradient
        guard let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations) else { print("gradient error"); return }
        chartDataSet.fill = Fill.fillWithLinearGradient(gradient, angle: 90.0)
        chartDataSet.drawFilledEnabled = true
        
        //Setting up axes
        chart.leftAxis.enabled = false
        chart.xAxis.labelPosition = .bottom
        chart.xAxis.drawGridLinesEnabled = false
        chart.chartDescription?.enabled = false
        chart.rightAxis.enabled = false
        chart.leftAxis.drawGridLinesEnabled = false
        chart.legend.enabled = false
        
        let finalValue = String(numbers[numbers.count - 1])
        portfolioValue.text = "$\(finalValue)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let customIndexPath = self.tableView.indexPathForSelectedRow!
        
        if segue.identifier == "clickRec" {
            navigationController?.setNavigationBarHidden(false, animated: true)
            let vc = segue.destination as? recViewController
            vc?.stateVal = recTableData[customIndexPath[1]].state
            vc?.priceVal = recTableData[customIndexPath[1]].price
            vc?.fuelVal = recTableData[customIndexPath[1]].fuel
            vc?.averageCostVal = recTableData[customIndexPath[1]].avgCost
            vc?.currentEquityVal = recTableData[customIndexPath[1]].currEquity
            vc?.serialNumVal = recTableData[customIndexPath[1]].serialNum
            vc?.expDateVal = recTableData[customIndexPath[1]].expDate
            vc?.generatorVal = recTableData[customIndexPath[1]].generator
        }
    }
    
}

struct recData {
    var state: String
    var fuel: String
    var price: Double
    var avgCost: Double
    var currEquity: Double
    var serialNum: String
    var expDate: String
    var generator: String
}

func getPrice(currEquity: Double) -> Double {
    let x = Int.random(in: 1...5)
    return currEquity/Double(x)
}

func getSerial() -> String {
    var serial = ""
    for _ in 0...5 {
        let x = Int.random(in: 0...9)
        serial.append(String(x))
    }
    serial.append("-")
    serial.append(String(Int.random(in: 1...9)))
    return serial
}


var recTableData: [recData] = []
extension PortfolioViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recTableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! recTableViewCell
        cell.stateLabel?.text = recTableData[indexPath.row].state
        cell.recTypeImage?.image = UIImage(named: recTableData[indexPath.row].fuel)
        cell.recPriceLabel?.text = "$\(String(format: "%.2f", recTableData[indexPath.row].price))"
        return cell
    }
}

extension UIResponder {
    func next<T: UIResponder>(_ type: T.Type) -> T? {
        return next as? T ?? next?.next(type)
    }
}

extension UITableViewCell {
    var tableView: UITableView? {
        return next(UITableView.self)
    }
    var indexPath: IndexPath? {
        return tableView?.indexPath(for: self)
    }
}
