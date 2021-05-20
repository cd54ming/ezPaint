//
//  Canvas.swift
//  ezPaintIPhone
//
//  Created by ChinMing Kuo on 2021/5/8.
//

import UIKit

class Canvas: UIView {
    var shape:Shape!
    var shapeList: [Shape] = []
    var shapeState:String = "Rectangle"
    let shapeFectory: ShapeFactory = ShapeFactory()
    let commandManager: CommandManager = CommandManager()
    var startPoint: Point = Point()
    var movedPoint: Point = Point()
    var isPressed: Bool = false
    var isMovingShape: Bool = true
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = touches.first?.location(in: self)
        
        startPoint = Point(touchPoint!.x, touchPoint!.y)
        let touchedShape = touchedShape(point: startPoint)
        
        if  touchedShape != nil {
            shape = touchedShape
            isMovingShape = true
        } else {
            shape = shapeFectory.GetShape(shapeState: shapeState, startPoint: startPoint, endPoint: startPoint)
            isMovingShape = false
        }
        
        isPressed = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = touches.first?.location(in: self)
        
        movedPoint = Point(touchPoint!.x, touchPoint!.y)
        
        if isMovingShape {
            let pointDiff = movedPoint - startPoint
            shape.move(pointDiff: pointDiff)
        } else {
            shape.endPoint = movedPoint
        }

        updateCanvas()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        if isMovingShape {
            let pointDiff = movedPoint - startPoint
            commandManager.execute(MoveCommand(canvas: self, shape: shape, pointDiff: pointDiff))
        }
        else {
            commandManager.execute(DrawCommand(canvas: self, shape: shape))
        }
        
        isMovingShape = false
        isPressed = false
        
        updateCanvas()
        
    }
    
    func touchedShape(point: Point) -> Shape? {
        for shape in shapeList {
            if shape.isSelected(point: point) {
                return shape
            }
        }
        
        return nil
    }
    
    func setShape(_ state: String) {
        shapeState = state
    }
    
    func drawShape(shape: Shape){
        shapeList.append(shape)
    }
    
    func draw() {
        self.layer.sublayers = nil
        
        for eachShape in shapeList {
            eachShape.draw()
            self.layer.addSublayer(eachShape.shapeLayer)
        }
        
        if isPressed {
            shape.draw()
            self.layer.addSublayer(shape.shapeLayer)
        }
    }
    
    func updateCanvas() {
        draw()
        self.setNeedsDisplay()
    }
    
    
    func deleteShape() {
        if shapeList.count >= 0 {
            shapeList.removeLast()
        }
    }
    
    func undo() {
        commandManager.undo()
        updateCanvas()
    }
    
    func redo() {
        commandManager.redo()
        updateCanvas()
    }
}
