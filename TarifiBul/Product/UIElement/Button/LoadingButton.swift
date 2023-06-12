//
//  AsyncButton.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 8.06.2023.
//

import Foundation
import UIKit

class LoadingButton : CircularButton {
    private var activityIndicator: UIActivityIndicatorView!
    var isLoading: Bool = false {
            didSet {
                if isLoading {
                    titleLabel?.text = ""
                    setTitle("", for: .normal)
                    showLoadingIndicator()
                    isEnabled = false
                } else {
                    hideLoadingIndicator()
                    isEnabled = true
                }
            }
        }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupIndicator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupIndicator()
        activityIndicator.isHidden = false
    
    }
     @objc private func buttonTapped() {
            isLoading = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isLoading = false
            }
        }
    private func setupIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .medium)
                activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .blue
                addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
                    activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
                ])
    }
    
    private func showLoadingIndicator() {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = false
        }
        
        private func hideLoadingIndicator() {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
        }
}
