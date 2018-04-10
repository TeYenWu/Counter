//
//  EllipseView.swift
//  Counter
//
//  Created by 吳德彥 on 10/04/2018.
//  Copyright © 2018 sodas. All rights reserved.
//

import UIKit

@IBDesignable
class EllipseView: UIView {

    @IBInspectable var strokeWidth: CGFloat = 0
    @IBInspectable var fillColor: UIColor = UIColor.black
    @IBInspectable var strokeColor: UIColor = UIColor.clear
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let rectangle = bounds.insetBy(dx: strokeWidth, dy: strokeWidth)

        context.setFillColor(fillColor.cgColor)
        context.setStrokeColor(strokeColor.cgColor)
        context.setLineWidth(strokeWidth)
        
        context.addEllipse(in: rectangle)

        context.drawPath(using: .fillStroke)
    }
}
