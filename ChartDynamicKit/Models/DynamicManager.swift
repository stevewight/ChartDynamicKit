//
//  DynamicManager.swift
//  c01ns
//
//  Created by Steve on 2/1/18.
//  Copyright © 2018 Steve Wight. All rights reserved.
//

class DynamicManager {
    var allData = [Double]()
    var currentData = [Double]()
    var dynamicRange = DynamicRange.third
    var startCount = 0
    var nextIndex = 0
    
    public init(range:DynamicRange) {
        dynamicRange = range
    }
    
    public func setData(_ data:[Double]) {
        allData = data
        startCount = dynamicRange.startCount(
            data: allData
        )
        nextIndex = (startCount - 1)
    }
    
    public func startData()->[Double] {
        return Array(allData.prefix(startCount))
    }
    
    public func updateIndex() {
        nextIndex += 1
        if nextIndex >= allData.count {
            nextIndex = 0
        }
    }
    
    public func nextValue()->Double {
        return allData[nextIndex]
    }
    
}
