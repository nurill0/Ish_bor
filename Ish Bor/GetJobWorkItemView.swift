//
//  GetJobWorkItemView.swift
//  Ish Bor
//
//  Created by Nurillo Domlajonov on 30/03/23.
//

import Foundation
import UIKit


class GetJobWorkItemView: UIView {
    
    lazy var userIcon: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "person.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.backgroundColor = .workPlaceBg()
        btn.layer.cornerRadius = 30
        
        
        return btn
    }()

    
    lazy var userNameLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Nurillo Domlajonov"
        lbl.font = UIFont(name: "Futura-Bold", size: 16)
        lbl.textAlignment = .left
        lbl.textColor = .titleModeColors()
        lbl.numberOfLines = 1
        
        return lbl
    }()
    
    lazy var jobLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Texnik usta  ● "
        lbl.font = UIFont(name: "Futura", size: 14)
        lbl.textAlignment = .left
        lbl.textColor = .gray
        lbl.numberOfLines = 1
        
        return lbl
    }()
    
    
    lazy var ratingLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "★ 4.7"
        lbl.font = UIFont(name: "Futura", size: 14)
        lbl.textAlignment = .left
        lbl.textColor = .titleModeColors()
        lbl.numberOfLines = 1
        
        return lbl
    }()
    
    lazy var callBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "phone")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.backgroundColor = .workPlaceBg()
        btn.layer.cornerRadius = 30
        
        return btn
    }()
    
    
    lazy var messageBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "message")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.backgroundColor = .workPlaceBg()
        btn.layer.cornerRadius = 30
        
        return btn
    }()
    
    lazy var getJobWorkBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Ishni olish", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Futura-Bold", size: 16)
        btn.backgroundColor = .baseColor()
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 20
        btn.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        return btn
    }()
  
    var buttonSize = CGFloat(60)
    var buttonRadius = CGFloat(30)
    
    convenience init(icon: String,
                     username: String,
                     job: String,
                     rating: String,
                     btnTitle: String
    ){
        self.init(frame: .zero)
        userIcon.setImage(UIImage(systemName: icon)?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        userNameLbl.text = username
        jobLbl.text = "\(job)  ● "
        ratingLbl.text = "★ \(rating)"
        getJobWorkBtn.setTitle(btnTitle, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureUI()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.cornerRadius = 20
    }
    
    private func configureUI(){
        self.addSubview(getJobWorkBtn)
        getJobWorkBtn.right(self.rightAnchor)
        getJobWorkBtn.left(self.leftAnchor)
        getJobWorkBtn.bottom(self.bottomAnchor)
        getJobWorkBtn.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.35).isActive = true
        
        self.addSubview(userIcon)
        userIcon.centerY(self.centerYAnchor, -20)
        userIcon.left(self.leftAnchor, 5)
        userIcon.height(60)
        userIcon.width(60)
        
        self.addSubview(callBtn)
        callBtn.layer.cornerRadius = userIcon.layer.cornerRadius
        callBtn.right(self.rightAnchor, -10)
        callBtn.centerY(userIcon.centerYAnchor)
        callBtn.height(60)
        callBtn.width(60)
        
        self.addSubview(messageBtn)
        messageBtn.layer.cornerRadius = userIcon.layer.cornerRadius
        messageBtn.right(callBtn.leftAnchor, -10)
        messageBtn.centerY(userIcon.centerYAnchor)
        messageBtn.height(60)
        messageBtn.width(60)
        
        self.addSubview(userNameLbl)
        userNameLbl.top(userIcon.topAnchor, 5)
        userNameLbl.left(userIcon.rightAnchor, 5)
        userNameLbl.right(messageBtn.leftAnchor, -5)
        
        self.addSubview(jobLbl)
        jobLbl.top(userNameLbl.bottomAnchor)
        jobLbl.left(userNameLbl.leftAnchor)
       
        
        self.addSubview(ratingLbl)
        ratingLbl.left(jobLbl.rightAnchor)
        ratingLbl.top(jobLbl.topAnchor)
        ratingLbl.right(userNameLbl.rightAnchor)
    }
    
}

