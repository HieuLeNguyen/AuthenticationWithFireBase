//
//  Helper.swift
//  AuthenticationWithFireBase
//
//  Created by Nguyễn Văn Hiếu on 22/11/24.
//

import UIKit

typealias BM = BackgroundManager

final class BackgroundManager: UIViewController {
    
    static var shared = BackgroundManager()
    
    // MARK: - Thêm các thay đổi vào Background
    public func addBackground(_ view: UIView) {
        // Kiểm tra xem đã có background chưa (dựa vào tên layer hoặc lớp)
        if let _ = view.layer.sublayers?.first(where: { $0.name == "backgroundLayer" }) {
            return
        }
        
        let circle1 = addCircleLayer(x: 57, y: -142, diameter: 496)
        let circle2 = addCircleLayer(x: 148, y: -327, diameter: 635, fillColor: true)
        let square1 = addSquareLayer(x: -264.7, y: 654.3, width: 372, rotationAngle: nil)
        let square2 = addSquareLayer(x: -119.6, y: 230, width: 362, rotationAngle: 27.09)
        
        view.layer.insertSublayer(circle1, at: 0)
        view.layer.insertSublayer(circle2, at: 0)
        view.layer.insertSublayer(square1, at: 0)
        view.layer.insertSublayer(square2, at: 0)
        
        // Đặt tên cho các layer để xác định và tránh thêm lại
        view.layer.sublayers?.forEach { $0.name = "backgroundLayer" }
    }
    
    // MARK: - Phương thức thêm hình vuông cho nền
    private func addSquareLayer(x: CGFloat, y: CGFloat, width: CGFloat, rotationAngle: CGFloat?) -> CAShapeLayer {
        let rectangleLayer = CAShapeLayer()
        let rectanglePath = UIBezierPath(rect: CGRect(x: x, y: y, width: width, height: width))
        rectangleLayer.path = rectanglePath.cgPath
        rectangleLayer.fillColor = nil
        rectangleLayer.lineWidth = 2
        rectangleLayer.strokeColor = UIColor.second.cgColor
        
        // FIXME: Lỗi Khi xoay hình
        // Đặt vị trí (tính trung tâm)
        if let rotationAngle = rotationAngle {
            rectangleLayer.position = CGPoint(x: x + (width / 2), y: y + (width / 2))
            rectangleLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            
            // Xoay góc
            let radians = rotationAngle * .pi / 180
            rectangleLayer.setAffineTransform(CGAffineTransform(rotationAngle: radians))
        }
        
        
        print("Adding rectangle at position: \(rectangleLayer.position)")
        
        return rectangleLayer
    }
    
    // MARK: - Phương thức thêm hình tròn cho nền
    private func addCircleLayer(x: CGFloat, y: CGFloat, diameter: CGFloat, fillColor: Bool = false) -> CAShapeLayer {
        let circleLayer = CAShapeLayer()
        let circlePath = UIBezierPath(ovalIn: CGRect(x: x, y: y, width: diameter, height: diameter))
        circleLayer.path = circlePath.cgPath
        
        if fillColor {
            circleLayer.fillColor = UIColor.second.cgColor
        } else {
            circleLayer.fillColor = nil
            circleLayer.lineWidth = 2
            circleLayer.strokeColor = UIColor.second.cgColor
        }
        
        return circleLayer
    }
}

