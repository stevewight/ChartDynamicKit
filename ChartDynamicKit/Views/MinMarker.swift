//
//  MinMarker.swift
//  c01ns
//
//  Created by Steve on 2/24/18.
//  Copyright © 2018 Steve Wight. All rights reserved.
//

import Charts
import MinChartKit

class MinMarker: BalloonMarker {

    var text = ""
    
    public init(text:String, line:MinLine) {
        super.init(
            color: .darkGray,
            font: UIFont(name: "AvenirNext-Regular", size: 12.0)!,
            textColor: .white,
            insets: UIEdgeInsets(
                top: 5.0, left: 10.0,
                bottom: 15.0, right: 10.0
            )
        )
       self.text = text
       self.setUp(line: line)
    }
    
    private func setUp(line:MinLine) {
        self.minimumSize = CGSize(width: 75, height: 30)
        self.chartView = line
    }
    
    open override func refreshContent(entry: ChartDataEntry, highlight: Highlight)
    {
        var newText = "\(text) @ "
        newText += "\(entry.y)"
        setLabel(newText)
    }

}
