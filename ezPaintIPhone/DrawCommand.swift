//
//  DrawCommand.swift
//  ezPaintIPhone
//
//  Created by ChinMing Kuo on 2021/5/8.
//

import Foundation


class DrawCommand : ICommand {
    private let _canvas: Canvas
    private var _shape: Shape
    
    
    init(canvas: Canvas, shape: Shape) {
        _canvas = canvas
        _shape = shape
    }
    
    func execute() {
        _canvas.drawShape(shape: _shape)
    }
    
    func reverseExecute() {
        _canvas.deleteShape()
    }
    
}
