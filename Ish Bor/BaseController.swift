//
//  BaseController.swift
//  Ish Bor
//
//  Created by Nurillo Domlajonov on 08/02/23.
//

import UIKit

class BaseController: UIViewController {
    
    lazy var baseContainerV: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .baseColor()
        
        return view
    }()
    
    lazy var logoImgView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "logoBG")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    lazy var pageTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Xush kelibsiz"
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = UIFont(name: "Futura", size: 20)
        
        return lbl
    }()
    
    
    lazy var customBackBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem()
        btn.title = "Ortga"
        btn.tintColor = .white
        
        return btn
    }()
    
}



//MARK: viewcontroller life cycle
extension BaseController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.backButtonTitle = "Ortga"
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    
}



//MARK: ui constraints
extension BaseController {
    
    
    fileprivate func configureUI(){
        view.backgroundColor = .baseColor()
        baseContainerVConst()
        logImgViewConst()
        welcomelblConst()
    }
    
    
    fileprivate func baseContainerVConst(){
        view.addSubview(baseContainerV)
        baseContainerV.top(view.topAnchor)
        baseContainerV.bottom(view.safeAreaLayoutGuide.bottomAnchor, 20)
        baseContainerV.left(view.leftAnchor)
        baseContainerV.right(view.rightAnchor)
    }
    
    
    fileprivate func logImgViewConst(){
        baseContainerV.addSubview(logoImgView)
        logoImgView.top(baseContainerV.safeAreaLayoutGuide.topAnchor)
        logoImgView.right(baseContainerV.rightAnchor, -40)
        logoImgView.left(baseContainerV.leftAnchor, 40)
        logoImgView.height(150)
    }
    
    
    fileprivate func welcomelblConst(){
        baseContainerV.addSubview(pageTitleLbl)
        pageTitleLbl.top(logoImgView.bottomAnchor, 0)
        pageTitleLbl.centerX(logoImgView.centerXAnchor)
    }
    
}
