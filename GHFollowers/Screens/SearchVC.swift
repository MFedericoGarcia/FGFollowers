//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Fede Garcia on 23/02/2024.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoPrincipal = UIImageView()
    let userNameTextField = FGTextField()
    let getFollowersButton = FGButton(backgroudColor: .systemGreen, title: "Get Followers", systemImage: SFSymbols.person3)
    var logoImageViewTopConstraint: NSLayoutConstraint!
    
    var isUsernameEntered: Bool {!userNameTextField.text!.isEmpty}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubviews(logoPrincipal, userNameTextField, getFollowersButton)
        configureLogoPrincipal()
        configureUsernameTF()
        configureFollowButton()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        userNameTextField.text = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowerListVC() {
        
        guard isUsernameEntered else {
            presentFGAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for 🐼. ", buttonTitle: "Ok")
            return
        }
        
        userNameTextField.resignFirstResponder()
        
        let followerListVC = FollowerListVC(username: userNameTextField.text!)
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    func configureLogoPrincipal() {
        logoPrincipal.translatesAutoresizingMaskIntoConstraints = false
        logoPrincipal.image = Images.fgLogo
        
        let topConstraint: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 20 : 80
        
        logoImageViewTopConstraint = logoPrincipal.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstraint)
        logoImageViewTopConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            logoPrincipal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoPrincipal.heightAnchor.constraint(equalToConstant: 200),
            logoPrincipal.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureUsernameTF() {
        userNameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: logoPrincipal.bottomAnchor, constant: 50),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureFollowButton() {
        getFollowersButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            getFollowersButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            getFollowersButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            getFollowersButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            getFollowersButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    

}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
