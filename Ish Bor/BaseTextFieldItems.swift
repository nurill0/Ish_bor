//
//  BaseTextFieldItems.swift
//  Ish Bor
//
//  Created by Nurillo Domlajonov on 22/02/23.
//

import UIKit


class BaseTextFieldItems: UIView {
    
    lazy var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Parol"
        lbl.textAlignment = .left
        lbl.textColor = .white
        lbl.font = UIFont(name: "Futura", size: 18)
        
        return lbl
    }()
    
    lazy var titleTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Parol"
        tf.textColor = .titleModeColors()
        tf.font = UIFont(name: "Futura", size: 20)
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.titleModeColors().cgColor
        tf.backgroundColor = .white
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tf.leftViewMode = .always
      
        tf.backgroundColor = .homeCellBg()
        
        return tf
    }()
    
    
    lazy var showPasswordBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "eye")?.withTintColor(.titleModeColors()).withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
        
        return btn
    }()
    
    var isHiddenPassword = true

    
    
    @objc func showHidePassword(){
        if isHiddenPassword{
            titleTF.isSecureTextEntry = false
            showPasswordBtn.setImage(UIImage(named: "hide")?.withTintColor(.titleModeColors()).withRenderingMode(.alwaysOriginal), for: .normal)
            isHiddenPassword = false
        }else{
            titleTF.isSecureTextEntry = true
            showPasswordBtn.setImage(UIImage(named: "eye")?.withTintColor(.titleModeColors()).withRenderingMode(.alwaysOriginal), for: .normal)
            isHiddenPassword = true
        }
    }
    
    
    convenience init(lblText: String, placeHolder: String, tfText: String,eyeBtn: Bool,rightV: Int){
        self.init(frame: .zero)
        self.titleLbl.text = lblText
        self.titleTF.placeholder = placeHolder
        self.titleTF.text = tfText
        self.showPasswordBtn.isHidden = eyeBtn
        self.titleTF.rightView = UIView(frame: CGRect(x: 0, y: 0, width: rightV, height: 0))
        self.titleTF.rightViewMode = .always
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        congigure()
        configureUI()
    }
    
    
    fileprivate func congigure(){
        translatesAutoresizingMaskIntoConstraints = false
        height(80)
    }
    
    fileprivate func configureUI(){
        lblConst()
        tfConst()
        eyeBtnConst()
    }
    
    fileprivate func lblConst(){
        self.addSubview(titleLbl)
        titleLbl.top(self.topAnchor)
        titleLbl.left(self.leftAnchor)
    }
    
    fileprivate func tfConst(){
        self.addSubview(titleTF)
        titleTF.top(titleLbl.bottomAnchor, 10)
        titleTF.left(self.leftAnchor)
        titleTF.right(self.rightAnchor)
        titleTF.bottom(self.bottomAnchor)
    }
    
    fileprivate func eyeBtnConst(){
        titleTF.addSubview(showPasswordBtn)
        showPasswordBtn.right(titleTF.rightAnchor, -10)
        showPasswordBtn.centerY(titleTF.centerYAnchor)
        showPasswordBtn.height(30)
        showPasswordBtn.width(30)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
