//
//  ViewProtocol.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/20/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit

protocol IndicatableView: class {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showErrorMessage(_ message: String)
}
