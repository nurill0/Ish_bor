//
//  SingUpController.swift
//  Ish Bor
//
//  Created by Nurillo Domlajonov on 08/02/23.
//

import UIKit
protocol PhoneNumberSend {
    func getPhoneNumber(_ phoneNum: String)
}

class SignUpController: BaseController,PhoneNumberSend {
    
    
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
    
    
    lazy var nameTF: BaseTextFieldItems = {
        let view = BaseTextFieldItems(lblText: "FIO", placeHolder: "F I O", tfText: "", eyeBtn: true, rightV: -10)
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
    
    
    lazy var passwordTF: BaseTextFieldItems = {
        let view = BaseTextFieldItems(lblText: "Yangi parol", placeHolder: "Yangi parol", tfText: "", eyeBtn: false, rightV: -50)
        view.titleTF.keyboardType = .default
        view.titleTF.isSecureTextEntry = true
        return view
    }()
    
    
    lazy var prePasswordTF: BaseTextFieldItems = {
        let view = BaseTextFieldItems(lblText: "Yangi parol", placeHolder: "Yangi parol", tfText: "", eyeBtn: false, rightV: -50)
        view.titleTF.keyboardType = .default
        view.titleTF.isSecureTextEntry = true
        return view
    }()
    
    
    lazy var changeBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Ro`yxatdan o`tish", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .buttonBgColor()
        btn.titleLabel?.font = UIFont(name: "Futura", size: 20)
        btn.titleLabel?.textAlignment = .center
        btn.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(goCodeConfirm), for: .touchUpInside)
        return btn
    }()
    
   
}



//ViewController life cycle
extension SignUpController {
    
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
extension SignUpController {
    
    @objc func keyboardWillShow(notification: NSNotification) {
        self.containerV.frame.origin.y -= 150
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.containerV.frame.origin.y += 150
    }
    
    @objc func goCodeConfirm(){
        let vc = CodeConfirmationController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func getPhoneNumber(_ phoneNum: String) {
        phoneTF.titleTF.text = phoneNum
    }
}



//UI
extension SignUpController {
    
    
    fileprivate func configureUI(){
     
        pageTitleLbl.text = "Ro`yxatdan o`tish"
        scrollViewConst()
        containerVConst()
        nameTFConst()
        phoneTFConst()
        passwordTFConst()
        prePasswordTFConst()
        jobTFConst()
        saveBtnConst()
    }
    
    
    ///Asosiy Saxifa,Sozlamalar bo'limida,scrollViewni ekranni to'ldirib turadigan qilib joylashtirish uchun funksiya
    fileprivate func scrollViewConst(){
        view.addSubview(scrollView)
        scrollView.contentSize = containerV.frame.size//CGSize(width: baseContainerV.frame.width, height: 2200)
        scrollView.top(pageTitleLbl.bottomAnchor, 10)
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
    
    
    fileprivate func nameTFConst(){
        scrollView.addSubview(nameTF)
        nameTF.top(containerV.topAnchor, 10)
        nameTF.right(containerV.rightAnchor, -15)
        nameTF.left(containerV.leftAnchor, 15)
    }
 
    
    fileprivate func phoneTFConst(){
        scrollView.addSubview(phoneTF)
        phoneTF.top(nameTF.bottomAnchor, 5)
        phoneTF.right(nameTF.rightAnchor)
        phoneTF.left(nameTF.leftAnchor)
    }
    
    
    fileprivate func passwordTFConst(){
        scrollView.addSubview(passwordTF)
        passwordTF.top(phoneTF.bottomAnchor, 5)
        passwordTF.right(nameTF.rightAnchor)
        passwordTF.left(nameTF.leftAnchor)
    }
    
    fileprivate func prePasswordTFConst(){
        scrollView.addSubview(prePasswordTF)
        prePasswordTF.top(passwordTF.bottomAnchor, 5)
        prePasswordTF.right(nameTF.rightAnchor)
        prePasswordTF.left(nameTF.leftAnchor)
    }
    
    fileprivate func jobTFConst(){
        scrollView.addSubview(jobTF)
        jobTF.top(prePasswordTF.bottomAnchor, 5)
        jobTF.right(nameTF.rightAnchor)
        jobTF.left(nameTF.leftAnchor)
    }
    

    fileprivate func saveBtnConst(){
        scrollView.addSubview(changeBtn)
        changeBtn.top(jobTF.bottomAnchor, 30)
        changeBtn.bottom(containerV.bottomAnchor)
        changeBtn.right(containerV.rightAnchor, -15)
        changeBtn.left(containerV.leftAnchor, 15)
        changeBtn.height(50)
    }
    
}
