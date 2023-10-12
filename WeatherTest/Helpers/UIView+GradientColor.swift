//
//  UIView+GradientColor.swift
//  OpenWeather
//
//  Created by Pratap Singh on 10/11/23
//

import UIKit

extension UIView {
    func setGradientBackground(firstColor: UIColor, secondColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.locations = [0, 4.0]
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
