//
//  DynamicRange.swift
//  Dynamico
//
//  Created by Steve on 6/1/18.
//  Copyright © 2018 Steve Wight. All rights reserved.
//

public enum DynamicRange:Double {
    case full = 1.0
    case half = 0.5
    case third = 0.33
    case quarter = 0.25
    
    public func startCount(data:[Double])->Int {
        let count = rawValue * Double(data.count)
        return Int(count)
    }
}
