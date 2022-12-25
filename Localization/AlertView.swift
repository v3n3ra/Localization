//
//  AlertView.swift
//  Localization
//
//  Created by V K on 24.12.2022.
//

import UIKit

protocol AlertViewDelegate: AnyObject {
    func didCloseView(_ view: AlertView)
}


class AlertView: UIView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dismissOutlet: UIButton!
    
    weak var delegate: AlertViewDelegate?
    
    func configure(_ text: String, buttonTitle: String) {
        titleLabel.text = text
        dismissOutlet.setTitle(buttonTitle, for: .normal)
    }


    @IBAction func dismissTapped(_ sender: Any) {
        removeFromSuperview()
        delegate?.didCloseView(self)
    }
}
