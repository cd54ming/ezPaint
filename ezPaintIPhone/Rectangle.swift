//
//  Rectangle.swift
//  ezPaintIPhone
//
//  Created by ChinMing Kuo on 2021/5/9.
//
import UIKit
import Foundation

class Rectangle : Shape {
    
    override func draw() {
        let recSize =  CGSize(width: endPoint.x - startPoint.x, height: endPoint.y - startPoint.y)
        let path = UIBezierPath(rect: CGRect(x: startPoint.x, y: startPoint.y, width: recSize.width, height: recSize.height))
        shapeLayer.path = path.cgPath
        
        
    }
    
    override func isSelected(point: Point) -> Bool {
        return (startPoint.x <= point.x && point.x <= endPoint.x) &&
            (startPoint.y <= point.y && point.y <= endPoint.y)
    }
    
}
