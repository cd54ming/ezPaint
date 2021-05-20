//
//  Shape.swift
//  ezPaintIPhone
//
//  Created by ChinMing Kuo on 2021/5/9.
//

import UIKit
import Foundation

class Shape {
    let shapeLayer: CAShapeLayer
    var startPoint: Point
    var endPoint: Point
    var previousMovedPoint: Point

    init(_ start: Point, _ end: Point) {
        shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.systemTeal.cgColor
        startPoint = start
        endPoint = end
        previousMovedPoint = Point()
    }
    
    func draw() {
        print("Shape Draw")
    }
    
    func isSelected(point: Point) -> Bool {
        return false
    }
    
    func move(pointDiff: Point)
    {
        startPoint = startPoint + (pointDiff - previousMovedPoint)
        endPoint = endPoint + (pointDiff - previousMovedPoint)
        previousMovedPoint = pointDiff
    }
    
    func moveEnd() {
        previousMovedPoint = Point()
    }
    
}

