//
//  Ex.swift
//  Metalic
//
//  Created by Anas Hamad on 09/05/1443 AH.
//

import Foundation
import UIKit

class Utils: NSObject {
    static func start(view:UIView,activityIndicator : UIActivityIndicatorView, isUserInteractionEnabled : Bool) -> Void {
        view.endEditing(true)
        activityIndicator.startAnimating()
        view.bringSubviewToFront(activityIndicator)
        view.isUserInteractionEnabled = isUserInteractionEnabled
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
    }
    
    static func stop(view:UIView,activityIndicator : UIActivityIndicatorView) -> Void {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
        view.isUserInteractionEnabled = true
    }
    
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "\(self)_comment")
      }
}
