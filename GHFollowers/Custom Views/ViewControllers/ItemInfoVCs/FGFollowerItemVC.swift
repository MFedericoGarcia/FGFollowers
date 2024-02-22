//
//  FGFollowerItemVC.swift
//  GHFollowers
//
//  Created by Fede Garcia on 17/04/2024.
//

import UIKit

protocol FGFollowerInfoVCDelegate: AnyObject {
    func didTapGetFollowers(for user: User)
}

class FGFollowerItemVC: FGItemInfoVC {
    
    weak var delegate: FGFollowerInfoVCDelegate!
    
    init(user: User, delegate: FGFollowerInfoVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(color: .systemGreen, title: "Get Followers", systemImage: SFSymbols.person3)
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
