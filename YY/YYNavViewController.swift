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
        var mvc = MainViewController()
        //mvc.navigationController = self
        super.init(rootViewController: mvc)
        //super.initWithRootViewController(MainViewController())
    }
    
    

    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder:aDecoder)
    }
}