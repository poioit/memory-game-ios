//
//  Extensions.swift
//  MemoryGame
//
//  Created by Korisnik on 04/02/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

extension UIViewController {
    
    public class func fromStoryboard() -> Self {
        func fromStoryboardHelper<T>() -> T where T : UIViewController {
            let storyboard = UIStoryboard(name: String(describing: T.self), bundle: nil)
            return storyboard.instantiateInitialViewController() as! T
        }
        return fromStoryboardHelper()
    }
}

extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0, y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.x, y: -origin.y, width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return rotatedImage ?? self
        }
        return self
    }
}

extension Int {
    var random: Int {
        get {
            if self > 0 {
                return Int(arc4random_uniform(UInt32(self)))
            }
            else if self < 0 {
                return Int(arc4random_uniform(UInt32(abs(self))))
            }
            else {
                return 0
            }
        }
    }
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        return array
    }
}

extension Float {
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
}
