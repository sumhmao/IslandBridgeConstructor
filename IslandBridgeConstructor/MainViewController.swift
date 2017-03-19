//
//  MainViewController.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/20/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

}

extension MainViewController: MainView {
    
}
