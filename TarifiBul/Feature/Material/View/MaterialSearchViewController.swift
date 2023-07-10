//
//  MaterialSearchViewController.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 10.07.2023.
//

import UIKit

class MaterialSearchViewController: UIViewController {

    let safeAreaView = UIView()
    let scrollView = UIScrollView()
    let contentView = UIView()
    let mylabel : UILabel = {
        let xlabel = UILabel()
        xlabel.text = "asdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADAasdsadsadASDADSASDADASDAASDADASDADA"
        xlabel.font = xlabel.font.withSize(60)
        xlabel.numberOfLines = 0
        return xlabel
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
         configure()
        // Do any additional setup after loading the view.
    }
    

}

extension MaterialSearchViewController {
    func configure(){
        addSubviews()
        setupAll()
        
    }
    func addSubviews(){
        view.addSubview(safeAreaView)
        safeAreaView.addSubview(scrollView)
        scrollView.addSubview(mylabel)

    }
    func setupAll(){
        setupView()
        setupSafeAreaView()
        setupScrollView()
        mylabel.snp.makeConstraints { make in
            make.centerX.equalTo(scrollView)
            make.edges.equalTo(scrollView)
        }
    }
    func setupView() {
        view.backgroundColor = .white
        
    }
    func setupSafeAreaView(){
        safeAreaView.snp.makeConstraints { make in
            safeAreaView.paddingPage()
        }
    }
    func setupScrollView(){
        scrollView.contentSize = safeAreaView.bounds.size
        scrollView.alwaysBounceVertical = true
        scrollView.snp.makeConstraints { make in
            scrollView.snp.makeConstraints { make in
                make.edges.equalTo(safeAreaView)
            }
        }
    }

}
