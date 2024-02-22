//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Fede Garcia on 29/02/2024.
//

import UIKit
import SafariServices

extension UIViewController {
    func presentFGAlertOnMainThread(title: String, message: String, buttonTitle: String) {
            let alertVC = FGAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        
    }
    
    func presentDefaultError() {
       
            let alertVC = FGAlertVC(title: "Something went wrong", message: "Unable to complete your task at this time", buttonTitle: "Ok")
                alertVC.modalPresentationStyle = .overFullScreen
                alertVC.modalTransitionStyle = .crossDissolve
                self.present(alertVC, animated: true)
        
    }
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredBarTintColor = .systemGreen
        present(safariVC, animated: true)
    }
    
    
}

