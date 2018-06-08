//
//  ChartDynamicKit.swift
//  c01ns
//
//  Created by Steve on 1/31/18.
//  Copyright © 2018 Steve Wight. All rights reserved.
//

import MinChartKit
import Charts

public protocol ChartDynamicDelegate {
    func chartDynamicUpdate(index:Int)
    func chartDynamicMarkerTag(index:Int)->MarkerTag?
}

public class ChartDynamicKit {
    public let line:MinLine
    public var color:UIColor
    public var delegate:ChartDynamicDelegate?
    public var state = DynamicState.playing
    var dynamicManager:DynamicManager
    var tick = Tick()
    
    public init(line:MinLine, color:UIColor = .darkGray) {
        self.line = line
        self.dynamicManager = DynamicManager(
            range: .quarter
        )
        self.color = color
    }
    
    public func start() {
        tick.stop()
        tick.start { self.tock() }
        state = .playing
    }
    
    public func stop() {
        tick.stop()
        state = .stopped
    }
    
    public func toggleState() {
        state.toggle()
        if state == .playing {
            start()
        } else if state == .stopped {
            stop()
        }
    }
    
    public func animate(_ duration:Double = 1.7) {
        line.animate(xAxisDuration: duration)
    }
    
    public func set(data:[Double]) {
        dynamicManager.setData(data)
        buildLineStartData()
        setLineVerticalSpace()
    }
    
    private func buildLineStartData() {
        MinChartKit(
            data: dynamicManager.startData(),
            color: color
        ).line(line)
    }
    
    private func setLineVerticalSpace() {
        line.leftAxis.spaceTop = 0.50
        line.leftAxis.spaceBottom = 0.50
    }
    
    private func markChart(index:Int, value:Double) {
        if let tag = delegate?.chartDynamicMarkerTag(index: index) {
            MarkerManager(line: line).highlight(tag: tag)
        }
    }
    
    private func tock() {
        if let data = line.lineData {
            let value = dynamicManager.nextValue()
            update(data: data, value: value)
            
            let index = dynamicManager.nextIndex
            markUpdate(index: index, value:value)
        }
    }
    
    private func update(data:LineChartData,value:Double) {
        DynamicData(data).update(value)
        line.notifyDataSetChanged()
    }
    
    private func markUpdate(index:Int, value:Double) {
        markChart(index: index,value: value)
        delegate?.chartDynamicUpdate(index: index)
        dynamicManager.updateIndex()
    }
    
}
