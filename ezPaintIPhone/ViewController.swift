//
//  ViewController.swift
//  ezPaintIPhone
//
//  Created by ChinMing Kuo on 2021/5/8.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var canvas: Canvas!
    
    @IBAction func setRectShape(_ sender: UIButton) {
        canvas.setShape("Rectangle")
    }
    
    @IBAction func setEllipseShape(_ sender: UIButton) {
        canvas.setShape("Ellipse")
    }
    
    @IBAction func setTriangleShape(_ sender: UIButton) {
        canvas.setShape("Triangle")
    }
    
    @IBAction func undo(_ sender: UIButton) {
        canvas.undo()
    }
    
    @IBAction func redo(_ sender: UIButton) {
        canvas.redo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        canvas.clipsToBounds = true
        canvas.isMultipleTouchEnabled = false
    }
    
    
}

