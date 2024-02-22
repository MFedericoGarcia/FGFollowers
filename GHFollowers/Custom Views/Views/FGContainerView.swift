//
//  ContainerView.swift
//  GHFollowers
//
//  Created by Fede Garcia on 01/03/2024.
//

import UIKit

class FGContainerView: UIView {

    override init(frame: CGRect) {
        super .init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(){
        super .init(frame: .zero)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
    }
}
