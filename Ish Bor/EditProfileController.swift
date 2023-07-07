//
//  EditProfileController.swift
//  Ish Bor
//
//  Created by Nurillo Domlajonov on 22/02/23.
//

import UIKit

class EditProfileController: BaseController {
    
    
    lazy var scrollView: UIScrollView = {
        let scrollV = UIScrollView()
        scrollV.translatesAutoresizingMaskIntoConstraints = false
        scrollV.showsVerticalScrollIndicator = false
        scrollV.backgroundColor = .clear
        return scrollV
    }()
    
    
    ///Asosiy Saxifa,Sozlamalar bo'limida,containerView
    lazy var containerV: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    
    lazy var nameSurnameTF: BaseTextFieldItems = {
        let view = BaseTextFieldItems(lblText: "Ism Familiya", placeHolder: "Ism Famliya", tfText: "", eyeBtn: true, rightV: -10)
        return view
    }()
    
    
    lazy var phoneTF: BaseTextFieldItems = {
        let view = BaseTextFieldItems(lblText: "Telefon raqam", placeHolder: "+998912345678", tfText: "", eyeBtn: true, rightV: -10)
        view.titleTF.keyboardType = .phonePad
        return view
    }()
    
    
    lazy var jobTF: BaseTextFieldItems = {
        let view = BaseTextFieldItems(lblText: "Kasb", placeHolder: "Kasbingizni kiriting", tfText: "", eyeBtn: true, rightV: -10)
        view.titleTF.keyboardType = .default
        return view
    }()
    
    
    lazy var oldPasswordTF: BaseTextFieldItems = {
        let view = BaseTextFieldItems(lblText: "Eski parol", placeHolder: "Eski parol", tfText: "", eyeBtn: false, rightV: -50)
        view.titleTF.keyboardType = .default
        view.titleTF.isSecureTextEntry = true
        return view
    }()
    
    
    lazy var newPasswordTF: BaseTextFieldItems = {
        let view = BaseTextFieldItems(lblText: "Yangi parol", placeHolder: "Yangi parol", tfText: "", eyeBtn: false, rightV: -50)
        view.titleTF.keyboardType = .default
        view.titleTF.isSecureTextEntry = true
        return view
    }()
    
    
    lazy var tryNewPasswordTF: BaseTextFieldItems = {
        let view = BaseTextFieldItems(lblText: "Yangi parol", placeHolder: "Yangi parol", tfText: "", eyeBtn: false, rightV: -50)
        view.titleTF.keyboardType = .default
        view.titleTF.isSecureTextEntry = true
        return view
    }()
    
    
    lazy var changeBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Saqlash", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .buttonBgColor()
        btn.titleLabel?.font = UIFont(name: "Futura", size: 20)
        btn.titleLabel?.textAlignment = .center
        btn.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    
}



//ViewController life cycle
extension EditProfileController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        configureUI()
    }
    
}



//actions
extension EditProfileController {
    
    @objc func keyboardWillShow(notification: NSNotification) {
        self.containerV.frame.origin.y -= 150
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.containerV.frame.origin.y += 150
    }
}



//UI
extension EditProfileController {
    
    
    fileprivate func configureUI(){
     
        pageTitleLbl.text = "Shaxsiy ma'lumotlarni tahrirlash"
        scrollViewConst()
        containerVConst()
        nameSurnameConst()
        phoneTFConst()
        jobTFConst()
        oldPasswordTFConst()
        newPasswordTFConst()
        tryNewPasswordTFConst()
        saveBtnConst()
        if UserDefaultsManager.shared.getUserType() == "Employer" {
            jobTF.isHidden = true
            oldPasswordTF.top(phoneTF.bottomAnchor, 20)
        }else{
            jobTF.isHidden = false
        }
    }
    
    
    ///Asosiy Saxifa,Sozlamalar bo'limida,scrollViewni ekranni to'ldirib turadigan qilib joylashtirish uchun funksiya
    fileprivate func scrollViewConst(){
        view.addSubview(scrollView)
        scrollView.contentSize = containerV.frame.size//CGSize(width: baseContainerV.frame.width, height: 2200)
        scrollView.top(pageTitleLbl.bottomAnchor, 20)
        scrollView.bottom(self.view.bottomAnchor, -20)
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
    
    
    fileprivate func nameSurnameConst(){
        scrollView.addSubview(nameSurnameTF)
        nameSurnameTF.top(containerV.topAnchor, 20)
        nameSurnameTF.right(containerV.rightAnchor, -15)
        nameSurnameTF.left(containerV.leftAnchor, 15)
    }
    
    fileprivate func phoneTFConst(){
        scrollView.addSubview(phoneTF)
        phoneTF.top(nameSurnameTF.bottomAnchor, 20)
        phoneTF.right(containerV.rightAnchor, -15)
        phoneTF.left(containerV.leftAnchor, 15)
    }
    
    fileprivate func jobTFConst(){
        scrollView.addSubview(jobTF)
        jobTF.top(phoneTF.bottomAnchor, 20)
        jobTF.right(containerV.rightAnchor, -15)
        jobTF.left(containerV.leftAnchor, 15)
    }
    
    fileprivate func oldPasswordTFConst(){
        scrollView.addSubview(oldPasswordTF)
        oldPasswordTF.top(jobTF.bottomAnchor, 20)
        oldPasswordTF.right(containerV.rightAnchor, -15)
        oldPasswordTF.left(containerV.leftAnchor, 15)
    }
    
    fileprivate func newPasswordTFConst(){
        scrollView.addSubview(newPasswordTF)
        newPasswordTF.top(oldPasswordTF.bottomAnchor, 20)
        newPasswordTF.right(containerV.rightAnchor, -15)
        newPasswordTF.left(containerV.leftAnchor, 15)
    }
    
    fileprivate func tryNewPasswordTFConst(){
        scrollView.addSubview(tryNewPasswordTF)
        tryNewPasswordTF.top(newPasswordTF.bottomAnchor, 20)
        tryNewPasswordTF.right(containerV.rightAnchor, -15)
        tryNewPasswordTF.left(containerV.leftAnchor, 15)
    }
    
    
    fileprivate func saveBtnConst(){
        scrollView.addSubview(changeBtn)
        changeBtn.top(tryNewPasswordTF.bottomAnchor, 30)
        changeBtn.bottom(containerV.bottomAnchor)
        changeBtn.right(containerV.rightAnchor, -15)
        changeBtn.left(containerV.leftAnchor, 15)
        changeBtn.height(50)
    }
    
}

