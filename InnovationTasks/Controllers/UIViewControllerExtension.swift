//
//  UIViewControllerExtension.swift
//  InnovationTasks
//
//  Created by Thiago Ramos on 24/11/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    var appDelegate: AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
   }
}
