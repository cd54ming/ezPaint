//
//  Triangle.swift
//  ezPaintIPhone
//
//  Created by ChinMing Kuo on 2021/5/10.
//

import UIKit
import Foundation

class Triangle: Shape {
    override func draw() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: startPoint.x, y: endPoint.y))
        path.addLine(to: CGPoint(x: (startPoint.x + endPoint.x) / 2, y: startPoint.y))
        path.addLine(to: CGPoint(x: endPoint.x, y: endPoint.y))
        path.close()
        shapeLayer.path = path.cgPath
    }
    
    override func isSelected(point: Point) -> Bool {
        // TODO: 判斷點在三角形內
        return (startPoint.x <= point.x && point.x <= endPoint.x) &&
            (startPoint.y <= point.y && point.y <= endPoint.y)
    }
}
