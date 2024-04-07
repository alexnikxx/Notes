//
//  SquaresColors.swift
//  Notes
//
//  Created by Aleksandra Nikiforova on 13/03/24.
//

import UIKit

final class CheckboxView: UIView {
    private let shapePosition: CGPoint = .zero
    private let shapeSize: CGSize = CGSize(width: 28, height: 28)

    override func draw(_ rect: CGRect) {
        let path = getCheckboxPath(in: CGRect(origin: shapePosition, size: shapeSize))
        path.lineWidth = 1.5
        path.stroke()
    }

    private func getCheckboxPath(in rect: CGRect) -> UIBezierPath {
        let halfSize: CGFloat = min(bounds.size.width / 2, bounds.size.height / 2)
        let desiredLineWidth: CGFloat = 4 // your desired value

        let circle = UIBezierPath(
            arcCenter: CGPoint(x: halfSize, y: halfSize),
            radius: CGFloat(halfSize - (desiredLineWidth / 2)),
            startAngle: CGFloat(0),
            endAngle: CGFloat(CGFloat.pi * 2),
            clockwise: true
        )
        circle.close()

        let check = UIBezierPath()
        check.lineWidth = 1.5
        check.move(to: CGPoint(x: 5, y: 13))
        check.addLine(to: CGPoint(x: 13, y: 22))
        check.addLine(to: CGPoint(x: 20, y: 6))

        circle.append(check)
        return circle
    }
}
