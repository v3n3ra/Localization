//
//  AlertView.swift
//  Localization
//
//  Created by V K on 24.12.2022.
//

import UIKit

class AlertView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dismissOutlet: UIButton!
   

    @IBAction func dismiss(_ sender: UIButton) {
        removeFromSuperview()
    }
}
