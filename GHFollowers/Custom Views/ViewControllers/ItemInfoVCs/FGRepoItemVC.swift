//
//  FGRepoItemVC.swift
//  GHFollowers
//
//  Created by Fede Garcia on 17/04/2024.
//

import UIKit

protocol FGRepoItemVCDelegate: AnyObject {
  
    func didTapGitHubProfile(for user: User)
}

class FGRepoItemVC: FGItemInfoVC {
    
    weak var delegate: FGRepoItemVCDelegate!
    
    
    init(user: User, delegate: FGRepoItemVCDelegate) {
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
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(color: .systemPurple, title: "GitHub Profile", systemImage: SFSymbols.person)
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}
