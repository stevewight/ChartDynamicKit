//
//  DynamicState.swift
//  Dynamico
//
//  Created by Steve on 6/5/18.
//  Copyright © 2018 Steve Wight. All rights reserved.
//

enum DynamicState {
    case playing
    case stopped
    
    mutating public func toggle() {
        switch self {
        case .playing:
            self = .stopped
        case .stopped:
            self = .playing
        }
    }
}
