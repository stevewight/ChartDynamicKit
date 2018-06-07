//
//  Tick.swift
//  c01ns
//
//  Created by Steve on 2/1/18.
//  Copyright © 2018 Steve Wight. All rights reserved.
//

import Foundation

class Tick {
    
    var timer:Timer?
    var duration = 0.125
    
    public init(_ duration:Double = 0.125) {
        self.duration = duration
    }
    
    public func start(complete:@escaping ()->Void) {
        timer = Timer.scheduledTimer(withTimeInterval: duration,
                             repeats: true) {_ in
            complete()
        }
    }
    
    public func stop() {
        if let t = timer {
            t.invalidate()
        }
    }
    
    public class func once(complete:@escaping ()->Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            complete()
        }
    }
    
    public class func once(seconds:Double, complete:@escaping ()->Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            complete()
        }
    }
    
}
