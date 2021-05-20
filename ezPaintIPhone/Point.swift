//
//  Point.swift
//  ezPaintIPhone
//
//  Created by ChinMing Kuo on 2021/5/9.
//

import UIKit
import Foundation

class Point {
    private var _x:CGFloat
    private var _y:CGFloat
    
    public var x: CGFloat {
        get {
            return _x
        }
        set(value) {
            _x = value
        }
    }
    
    public var y: CGFloat {
        get {
            return _y
        }
        set {
            _y = newValue
        }
    }
    
    init()
    {
        _x = 0.0
        _y = 0.0
    }
    
    init (_ x: CGFloat, _ y: CGFloat)
     {
         _x = x;
         _y = y;
     }
    
    init (point: Point)
    {
        _x = point.x
        _y = point.y
    }
    
    static func +(leftPoint: Point, rightPoint: Point) -> Point {
        return Point(leftPoint.x + rightPoint.x, leftPoint.y + rightPoint.y)
    }
    
    static func -(leftPoint: Point, rightPoint: Point) -> Point {
        return Point(leftPoint.x - rightPoint.x, leftPoint.y - rightPoint.y)
    }
    
}
