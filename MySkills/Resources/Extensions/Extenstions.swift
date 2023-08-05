//
//  Extenstions.swift
//  MySkills
//
//  Created by Alisher Manatbek on 05.08.2023.
//

import UIKit
import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: K.emptyString)
    }
}

extension UIImageView {
    func shapeToCircle() {
        self.layer.cornerRadius = self.frame.width / 2.0;
    }
}

extension UIView {
    public var width: CGFloat {
        self.frame.size.width
    }
    
    public var height: CGFloat {
        self.frame.size.height
    }
    
    public var top: CGFloat {
        self.frame.origin.y
    }
    
    public var bottom: CGFloat {
        self.frame.size.height + self.frame.origin.y
    }

    public var left: CGFloat {
        self.frame.origin.x
    }
    
    public var right: CGFloat {
        self.frame.size.width + self.frame.origin.x
    }
}
