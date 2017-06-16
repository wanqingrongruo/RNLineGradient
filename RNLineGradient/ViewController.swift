//
//  ViewController.swift
//  RNLineGradient
//
//  Created by 婉卿容若 on 2017/6/15.
//  Copyright © 2017年 婉卿容若. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    var lineChart: LineChart!
     var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var views: [String: AnyObject] = [:]
        
        // simple arrays
        let data: [CGFloat] = [1, -3, 7, 6, 4]
        
        // simple line with custom x axis labels
        let xLabels: [String] = ["1月", "2月", "3月", "4月", "5月"]
        
        
        label.text = "..."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        self.view.addSubview(label)
        views["label"] = label
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[label]", options: [], metrics: nil, views: views))
        
        
        lineChart = LineChart()
        //(frame: CGRect(x: 20, y: 200, width: UIScreen.main.bounds.size.width-40, height: 200))
        lineChart = LineChart()
        lineChart.animation.enabled = true
        lineChart.area = true
        lineChart.x.labels.visible = true
        lineChart.x.grid.count = 5
        lineChart.y.grid.count = 4
        lineChart.x.labels.values = xLabels
        lineChart.y.labels.visible = true
        lineChart.addLine(data)
        
        lineChart.translatesAutoresizingMaskIntoConstraints = false
        lineChart.delegate = self
        self.view.addSubview(lineChart)
        
        views["chart"] = lineChart
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[chart]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[label]-[chart(==200)]", options: [], metrics: nil, views: views))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: LineChartDelegate {
    func didSelectDataPoint(_ x: CGFloat, yValues: Array<CGFloat>) {
       // label.text = "x: \(x)     y: \(yValues)"
    }
}

extension ViewController{
    
    /**
     * Redraw chart on device rotation.
     */
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        if let chart = lineChart {
            chart.setNeedsDisplay()
        }
    }
}

