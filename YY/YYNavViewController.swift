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
        var mvc = MainViewController(nibName: nil, bundle: nil)
        super.init(rootViewController: mvc)
        //var t = temp()
        //super.init(rootViewController:t)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nil, bundle: nibBundleOrNil)
    }

    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder:aDecoder)
    }
}