//
//  UIViewController+Assessment.swift
//  Assessment
//
//  Created by Joseph on 11/01/2022.
//

import Foundation
import UIKit

extension UIViewController {
    class var storyboardID: String {
        return "\(self)"
    }
    
    static func initiateFrom(Storybaord storybaord: Storyboard) -> Self {
        return storybaord.viewController(Class: self)
    }
}

// MARK: - StoryBoard Configurator
enum Storyboard: String {
    case main = "Main" ///we can add more cases if working in bigger teams and more storyboard files are created
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }

    func viewController<T: UIViewController>(Class viewControllerClass: T.Type) -> T {
        let  storboardID = (viewControllerClass as UIViewController.Type).storyboardID
        return self.instance.instantiateViewController(withIdentifier: storboardID) as! T
    }
}
