//
//  UIViewController+Extension.swift
//  AuthenticationWithFireBase
//
//  Created by Nguyễn Văn Hiếu on 22/11/24.
//

import UIKit

extension UIViewController {
    
    // MARK: - Add Background
    public func addBackground() {
        addCircleLayer(x: 57, y: -142, diameter: 496)
        addCircleLayer(x: 148, y: -327, diameter: 635, fillColor: true)
        addRectangleLayer(x: -264.7, y: 684.3, width: 372, height: 372)
        addRectangleLayer(x: -153.6, y: 625, width: 372, height: 372, rotationAngle: -27.09)
    }
    
    private func addRectangleLayer(
        x: CGFloat,
        y: CGFloat,
        width: CGFloat,
        height: CGFloat,
        rotationAngle: CGFloat = 0 // Góc xoay (mặc định là 0)
    ) {
        let rectangleLayer = CAShapeLayer()
        let rectanglePath = UIBezierPath(rect: CGRect(x: x, y: y, width: width, height: height))
        rectangleLayer.path = rectanglePath.cgPath
        rectangleLayer.fillColor = nil
        rectangleLayer.lineWidth = 2
        rectangleLayer.strokeColor = UIColor(red: 248/255, green: 249/255, blue: 255/255, alpha: 1).cgColor
        
        // FIXME: Lỗi Khi xoay hình
        // Đặt vị trí (tính trung tâm)
        //        rectangleLayer.position = CGPoint(x: x + width / 2, y: y + height / 2)
        //        rectangleLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        // Xoay góc
        let radians = rotationAngle * .pi / 180
        rectangleLayer.setAffineTransform(CGAffineTransform(rotationAngle: radians))
        
        print("Adding rectangle at position: \(rectangleLayer.position), rotation: \(rotationAngle)°")
        
        view.layer.insertSublayer(rectangleLayer, at: 0)
    }
    
    
    private func addCircleLayer(
        x: CGFloat,
        y: CGFloat,
        diameter: CGFloat,
        fillColor: Bool = false
    ) {
        let circleLayer = CAShapeLayer()
        let circlePath = UIBezierPath(ovalIn: CGRect(x: x, y: y, width: diameter, height: diameter))
        circleLayer.path = circlePath.cgPath
        if fillColor {
            circleLayer.fillColor = UIColor(red: 248/255, green: 249/255, blue: 255/255, alpha: 1).cgColor
        } else {
            circleLayer.fillColor = nil
            circleLayer.lineWidth = 2
            circleLayer.strokeColor = UIColor(red: 248/255, green: 249/255, blue: 255/255, alpha: 1).cgColor
        }
        
        view.layer.insertSublayer(circleLayer, at: 0)
    }
}
