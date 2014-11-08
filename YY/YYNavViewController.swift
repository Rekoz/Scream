//
//  YYNavViewController.swift
//  YY
//
//  Created by Rekoz on 11/8/14.
//
//

import Foundation
import UIKit
//import MainViewController

class YYNavViewController: UINavigationController {
    override init() {
        super.init(rootViewController: MainViewController())
        //super.initWithRootViewController(MainViewController())
    }

    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder:aDecoder)
    }
}