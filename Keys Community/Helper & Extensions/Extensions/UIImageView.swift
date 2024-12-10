//
//  UIImageView.swift
//  Keys Community
//
//  Created by Haroon Shoukat on 11/06/2023.
//

import Foundation
import UIKit

extension UIImageView{
    public func maskCircle(anyImage: UIImage) {
        self.contentMode = UIView.ContentMode.scaleAspectFill
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true

       // make square(* must to make circle),
       // resize(reduce the kilobyte) and
       // fix rotation.
       self.image = anyImage
      }
}
