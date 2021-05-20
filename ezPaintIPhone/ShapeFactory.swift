//
//  ShapeFectory.swift
//  ezPaintIPhone
//
//  Created by ChinMing Kuo on 2021/5/9.
//

import Foundation

class ShapeFactory {
    func GetShape(shapeState: String, startPoint: Point, endPoint: Point) -> Shape {
        switch shapeState  {
        case "Rectangle":
            return Rectangle(startPoint, endPoint)
        case "Triangle":
            return Triangle(startPoint, endPoint)
        case "Ellipse":
            return Ellipse(startPoint, endPoint)
        default:
            return Shape(startPoint, endPoint)
        }
    }
}
