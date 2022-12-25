//
//  ProgrammaticAlertView.swift
//  Localization
//
//  Created by V K on 25.12.2022.
//

import UIKit

protocol AlertViewDelegate: AnyObject {
    func didCloseView(_ view: ProgrammaticAlertView)
}

class ProgrammaticAlertView: UIView {
    private let christmasText: UITextView = {
        let textView = UITextView(frame: CGRect(x: 94, y: 147, width: 200, height: 200))
        textView.backgroundColor = .none
        textView.contentInsetAdjustmentBehavior = .automatic
        textView.textAlignment = .center
        textView.font = UIFont(name: "Georgia", size: 35)
        textView.textColor = .white
        textView.text = " Merry Christmas!"
        textView.isEditable = false
        return textView
    }()
    
    private let frameBackground: UIView = {
        let view = UIView(frame: CGRect(x: 55, y: 100, width: 280, height: 200))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "ChristmasGreen")
        return view
    }()
    
    private let christmasFrame: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 7.5, y: 70, width: 370, height: 250))
        view.image = UIImage(named: "ChristmasFrame")
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        return view
    }()
    
    private let santa: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 350, width: 300, height: 400))
        view.image = UIImage(named: "Santa")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let snow: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 550, width: 500, height: 400))
        view.image = UIImage(named: "snow")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let hohoButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 250, y: 400, width: 115, height: 50))
        button.setTitle(" Ho-Ho-Ho! ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "White05")
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 7
        button.layer.cornerCurve = .continuous
        return button
    }()
    
    weak var delegate: AlertViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView() {
        backgroundColor = .brown
        backgroundColor?.withAlphaComponent(0.5)
        addSubview(frameBackground)
        addSubview(christmasFrame)
        addSubview(christmasText)
        addSubview(snow)
        addSubview(santa)
        hohoButton.addTarget(self, action: #selector(hohoButtonPressed), for: .touchUpInside)
        addSubview(hohoButton)
        
    }
    
    @objc func hohoButtonPressed(sender: UIButton) {
        removeFromSuperview()
        delegate?.didCloseView(self)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
