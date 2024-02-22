//
//  FGButton.swift
//  GHFollowers
//
//  Created by Fede Garcia on 23/02/2024.
//

import UIKit

class FGButton: UIButton {

    override init(frame: CGRect) {
        super .init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroudColor: UIColor, title: String, systemImage: String) {
        self.init(frame: .zero)
        set(color: backgroudColor, title: title, systemImage: systemImage)
        }
    
    private func configure() {
        
        configuration = .tinted()
        configuration?.cornerStyle = .large
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(color: UIColor, title: String, systemImage: String) {
        
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.title = title
        configuration?.image = UIImage(systemName: systemImage)
        configuration?.imagePadding = 10
    }

}
