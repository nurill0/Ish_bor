//
//  AboutAppController.swift
//  Ish Bor
//
//  Created by Nurillo Domlajonov on 22/02/23.
//

import UIKit



class AboutAppController: BaseController {
    
    lazy var scrollView: UIScrollView = {
        let scrollV = UIScrollView()
        scrollV.translatesAutoresizingMaskIntoConstraints = false
        scrollV.backgroundColor = .clear
        scrollV.showsVerticalScrollIndicator = false
        scrollV.backgroundColor = .homeCellBg()
        
        return scrollV
    }()
    
    ///Asosiy Saxifa,Sozlamalar bo'limida,containerView
    lazy var containerV: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        return view
    }()

    lazy var aboutLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = aboutApp
        lbl.textColor = .white//UIColor.titleModeColors()
        lbl.textAlignment = .natural
        lbl.font = UIFont(name: "Futura-Medium", size: 22)
        lbl.numberOfLines = 0
        
        return lbl
    }()

}




extension AboutAppController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.view.traitCollection.userInterfaceStyle == .dark {
            scrollView.backgroundColor = .homeCellBg()
        }else{
            scrollView.backgroundColor = .clear
        }
        configureUI()
    }
}



extension AboutAppController {
    
    fileprivate func configureUI(){
        self.pageTitleLbl.text = "Ilova haqida"
        scrollViewConst()
        containerVConst()
        aboutAppLblConst()
    }
    
    ///Asosiy Saxifa,Sozlamalar bo'limida,scrollViewni ekranni to'ldirib turadigan qilib joylashtirish uchun funksiya
    fileprivate func scrollViewConst(){
        view.addSubview(scrollView)
        scrollView.contentSize = baseContainerV.frame.size
        scrollView.top(pageTitleLbl.bottomAnchor, 20)
        scrollView.bottom(self.view.bottomAnchor)
        scrollView.right(self.view.rightAnchor)
        scrollView.left(self.view.leftAnchor)
        scrollView.centerX(self.view.centerXAnchor)
    }
    
    
    ///Asosiy Saxifa,Sozlamalar bo'limida,containerViewni scrollViewni to'ldiradigan qilib joylashtirish
    fileprivate func containerVConst(){
        scrollView.addSubview(containerV)
        containerV.top(self.scrollView.topAnchor)
        containerV.bottom(self.scrollView.bottomAnchor)
        containerV.right(self.scrollView.rightAnchor)
        containerV.left(self.scrollView.leftAnchor)
        containerV.centerX(self.scrollView.centerXAnchor)
    }
    

    
    fileprivate func aboutAppLblConst(){
        containerV.addSubview(aboutLbl)
        aboutLbl.top(containerV.topAnchor)
        aboutLbl.right(containerV.rightAnchor, -10)
        aboutLbl.left(containerV.leftAnchor, 10)
        aboutLbl.bottom(containerV.bottomAnchor)
    }
    
    
}
