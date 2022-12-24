//
//  ViewController.swift
//  Localization
//
//  Created by V K on 24.12.2022.
//

import UIKit

class ViewController: UIViewController {
   
    let myLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " placeholder "
        label.textColor = .white
        label.layer.borderWidth = 0.6
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.cornerRadius = 3
        label.font = .systemFont(ofSize: 35)
        label.backgroundColor = UIColor(named: "labelBackground")
        return label
    }()
    
    let localizeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setTitle(" Localize ", for: .normal)
        button.titleLabel?.font = UIFont.monospacedDigitSystemFont(ofSize: 30, weight: .semibold)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 3
        return button
    }()
    
    let alertButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setTitle(" Alert ", for: .normal)
        button.titleLabel?.font = UIFont.monospacedDigitSystemFont(ofSize: 30, weight: .semibold)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 3
//        button.layer.opacity = 0.85
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.applyGradient(isVertical: false, colorArray: [.cyan, .magenta])
        
        view.addSubview(myLabel)
        
        localizeButton.addTarget(self, action: #selector(localizeButtonTapped), for: .touchUpInside)
        view.addSubview(localizeButton)
        alertButton.addTarget(self, action: #selector(alertButtonTapped), for: .touchUpInside)
        view.addSubview(alertButton)
        
        
        setupConstraints()
    }
    

    func setupConstraints() {
        NSLayoutConstraint.activate([
            myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
        ])
        NSLayoutConstraint.activate([
            localizeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -55),
            localizeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
        NSLayoutConstraint.activate([
            alertButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            alertButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -55)
        ])
    }
    
    
    @objc func localizeButtonTapped(sender: UIButton) {
        myLabel.text = NSLocalizedString("MY.LOCALIZED.TEXT", comment: "title text on the main screen")
    }
    
    @objc func alertButtonTapped(sender: UIButton) {
        guard let alertView = Bundle.main.loadNibNamed("AlertView", owner: nil)?.first as? AlertView else { return }
        alertView.translatesAutoresizingMaskIntoConstraints = false
        
        alertView.frame = CGRect(x: view.center.x, y: view.center.y, width: 0, height: 0)
        
        view.addSubview(alertView)
        
        NSLayoutConstraint.activate([
            alertView.leftAnchor.constraint(equalTo: view.leftAnchor),
            alertView.rightAnchor.constraint(equalTo: view.rightAnchor),
            alertView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            alertView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        UIView.animate(withDuration: 0.5, delay: 0) {
//            NSLayoutConstraint.activate([
//                alertView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
//                alertView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
//                alertView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//                alertView.topAnchor.constraint(equalTo: self.view.topAnchor)
//            ])
            self.view.layoutIfNeeded()
        }
        
//        view.setNeedsLayout()
    }
}


extension UIView {
    
    func applyGradient(isVertical: Bool, colorArray: [UIColor]) {
        layer.sublayers?.filter{ $0 is CAGradientLayer }.forEach{ $0.removeFromSuperlayer() }
         
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorArray.map{ $0.cgColor }
        if isVertical {
            //top to bottom
            gradientLayer.locations = [0.0, 1.0]
        } else {
            //left to right
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        
        backgroundColor = .clear
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
