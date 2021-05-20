//
//  MoveCommand.swift
//  ezPaintIPhone
//
//  Created by ChinMing Kuo on 2021/5/8.
//

import Foundation

class MoveCommand : ICommand {
    private let _canvas: Canvas
    private var _shape: Shape
    private var _pointDiff: Point
    
    init(canvas: Canvas, shape: Shape, pointDiff: Point) {
        _canvas = canvas
        _shape = shape
        _pointDiff = pointDiff
    }
    
    func execute() {
        _shape.move(pointDiff: _pointDiff)
        _shape.moveEnd()
    }
    
    func reverseExecute() {
        _shape.move(pointDiff: Point(-_pointDiff.x, -_pointDiff.y))
        _shape.moveEnd()
    }
}
