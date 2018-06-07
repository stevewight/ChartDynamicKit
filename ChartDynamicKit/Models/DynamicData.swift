//
//  DynamicData.swift
//  c01ns
//
//  Created by Steve on 2/1/18.
//  Copyright © 2018 Steve Wight. All rights reserved.
//

import Charts

class DynamicData  {
    let chartData:ChartData
    
    public init(_ data:ChartData) {
        chartData = data
    }
    
    public func update(_ newData:Double) {
        if let entry = chartData.dataSets.first?.entryForIndex(0) {
            let x = lastIndex(entry)
            removeFirstEntry(entry)
            addLastEntry(x: x, y: newData)
        }
    }
    
    private func removeFirstEntry(_ entry:ChartDataEntry) {
        chartData.removeEntry(entry, dataSetIndex: 0)
    }
    
    private func addLastEntry(x:Double, y:Double) {
        let newEntry = ChartDataEntry(x: x, y: y)
        chartData.addEntry(newEntry, dataSetIndex: 0)
    }
    
    private func lastIndex(_ entry:ChartDataEntry)->Double {
        let setCount = chartData.dataSets.first?.entryCount
        return entry.x + Double(setCount!)
    }
}
