//
//  FGEmptyStateView.swift
//  GHFollowers
//
//  Created by Fede Garcia on 12/03/2024.
//

import UIKit

class FGEmptyStateView: UIView {

    let messageLabel = FGTitleLabel(textAlignment: .center, fontSize: 28)
    let logoImageLabel = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(message: String) {
        self.init(frame: .zero)
        messageLabel.text = message
    }
    
    private func configure() {
        self.addSubviews(messageLabel, logoImageLabel)
        
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        logoImageLabel.image = UIImage(named: "empty-state-logo")
        logoImageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
            
            logoImageLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.3),
            logoImageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
            logoImageLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 40)
        ])
    }
}
