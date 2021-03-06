//
//  UIViewController+Ext.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 4/24/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//
import UIKit
import SafariServices

fileprivate var containerView: UIView!

extension UIViewController{
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
            
        }
    }
    
    func makeSafariVC(with url: URL) {
        let safariVC    = SFSafariViewController(url: url)
        
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
    
    func showProgressIndicator() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor  = .systemBackground
        containerView.alpha            = 0
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.7
        }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints  = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        activityIndicator.startAnimating()
    }
    
    func dismissIndicator() {
        
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
}
