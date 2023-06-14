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
    var isLoading: Bool = false
    var title : String?
    @objc var onClick : (() ->Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        setupIndicator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
        setupIndicator()
        title = title(for: .normal)
    
    }
    @objc func changeLoadingState() {
        if !isLoading {
            isLoading = true
            isEnabled = false
            title = title(for: .normal)
            setTitle("", for: .normal)
            showLoadingIndicator()
           
            
        }
        else  {
            isLoading = false
            isEnabled = true
            setTitle(self.title, for: .normal)
            hideLoadingIndicator()
        }
    }
    
    
    private func setupButton(){
       // self.addTarget(self, action: #selector(changeLoadingState), for: .touchUpInside)
    }
    private func setupIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .blue
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
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
/*class LoadingButton : CircularButton {
    private var activityIndicator: UIActivityIndicatorView!
    var isLoading: Bool = false
    var title : String?

    override init(frame: CGRect) {
        super.init(frame: frame)
  
        setupIndicator()
        title = title(for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupIndicator()
        title = title(for: .normal)
        
    }
    @objc func changeLoadingState() {
        if !isLoading {
            showLoadingIndicator()
            hideTitle()
            isLoading = true
        }
        else  {
            hideLoadingIndicator()
            showTitle()
            isLoading = false
        }
    }
    
    private func setupIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .blue
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
    }
    private func showLoadingIndicator() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    private func hideLoadingIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    private func hideTitle(){
        setTitle("", for: .normal)
    }
    private func showTitle(){
        setTitle(title, for: .normal)
    }
}*/

