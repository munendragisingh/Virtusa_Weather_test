//
//  UIImageView+DownloadImage.swift
//  OpenWeather
//
//  Created by Pratap Singh on 10/12/23.
//

import UIKit
import Kingfisher

extension UIImageView {
    func downloadImageWithThirdPartyLibrary(fromUrl: URL?) {
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: fromUrl,
            placeholder: nil,
            options: [
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
}
