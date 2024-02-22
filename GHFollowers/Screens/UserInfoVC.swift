//
//  UserInfoVC.swift
//  GHFollowers
//
//  Created by Fede Garcia on 20/03/2024.
//

import UIKit


protocol UserInfoVCDelegate: AnyObject {
    func didRequestFollowers(for username: String)
}

class UserInfoVC: FGDataLoadingVC {
    
    let headerView = UIView()
    let itemviewOne = UIView()
    let itemViewTwo = UIView()
    let dateLabel = FGBodyLabel(textAlignment: .center)
    
    var itemViews: [UIView] = []
    
    
    var username: String!
    weak var delegate: UserInfoVCDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        getUserInfo()
        layoutUI()
    }
    
    func configureViewControllers() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func getUserInfo() {
        Task {
            do {
                let user = try await NetworkManager.shared.getUser(for: username)
                configureUIElements(with: user)
            } catch {
                if let fgError = error as? FGError {
                    presentFGAlertOnMainThread(title: "Bad stuff happend", message: fgError.rawValue, buttonTitle: "ok")
                } else {
                    presentDefaultError()
                }
            }
        }
    }
    
    func configureUIElements( with user: User) {
        self.add(childVC: FGUserInfoHeaderVC(user: user), to: self.headerView)
        self.add(childVC: FGRepoItemVC(user: user, delegate: self), to: self.itemviewOne)
        self.add(childVC: FGFollowerItemVC(user: user, delegate: self), to: self.itemViewTwo)
        self.dateLabel.text = "GitHub since \(user.createdAt.convertToMonthYearFormat())"
        
    }
    
    func layoutUI() {
        
        itemViews = [headerView, itemviewOne, itemViewTwo, dateLabel]
        
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140
        
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        }
        
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            itemviewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemviewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemviewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func add(childVC: UIViewController, to containerView: UIView){
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    

}

extension UserInfoVC: FGRepoItemVCDelegate {
    
    func didTapGitHubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentFGAlertOnMainThread(title: "Invalid URL", message: "The url attached to this is invalid." , buttonTitle: "Ok")
            return
        }
        presentSafariVC(with: url)
    }
}

extension UserInfoVC: FGFollowerInfoVCDelegate {
    func didTapGetFollowers(for user: User) {
        guard user.followers != 0 else {
            presentFGAlertOnMainThread(title: "No followers", message: "This user has no followers", buttonTitle: "So sad")
            return
        }
        delegate.didRequestFollowers(for: user.login)
        dismissVC()
    }
}

