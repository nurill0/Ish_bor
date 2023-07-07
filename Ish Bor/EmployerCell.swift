//
//  EmployerCell.swift
//  Ish Bor
//
//  Created by Nurillo Domlajonov on 22/02/23.
//
import UIKit

class EmployerCell: UICollectionViewCell {
    
    static let identifier = "EmployerCell"
    lazy var containerV: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .homeCellBg()
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        return view
    }()
    
    lazy var workImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "plumber")
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    lazy var locationBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "orderWorker")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        btn.layer.cornerRadius = 15
        btn.layer.maskedCorners = [.layerMinXMaxYCorner]
        btn.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(openMap), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var workerJobLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Elektrik"
        lbl.textAlignment = .right
        lbl.font = UIFont(name: "Futura-Medium", size: 16)//.systemFont(ofSize: 18, weight: .medium)
        lbl.textColor =  .titleModeColors()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        
        return lbl
    }()
    
    
    lazy var workerNameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Mirzaabdullayev Shoxrux".maxLength(length: 75)
        lbl.textAlignment = .left
        lbl.font =  UIFont(name: "Futura-Bold", size: 16)
        lbl.textColor =  .titleModeColors()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 2
        
        return lbl
    }()
    
    lazy var experienceLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Ish Tajribasi: \(experience)"
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 14, weight: .medium)
        lbl.textColor = .titleModeColors()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        
        return lbl
    }()
    
    lazy var reytingLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Reyting: \(reyting) "
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 14, weight: .bold)
        lbl.textColor =  .titleModeColors()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        
        return lbl
    }()
    
    var experience = "1 yillik"
    var reyting  = "⭐️⭐️⭐️⭐️"
    
    @objc func openMap(){
    }
    
    func getItemsForCell(job: String, workerName: String, workerReyting: String, workerExperience: String, workImgName: String) {
        self.workerJobLbl.text = job
        self.workerNameLbl.text = workerName
        self.reytingLbl.text = workerReyting
        self.experienceLbl.text = workerExperience
        self.workImageView.image = UIImage(named: workImgName)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
}




extension EmployerCell {
    fileprivate func configureUI(){
        containerVConst()
        workImgVConst()
        locationBtnConst()
        workJobLblConst()
        workStatusLblConst()
        workPriceLblConst()
        workTitleLblConst()
    }
    
    fileprivate func containerVConst(){
        self.addSubview(containerV)
        containerV.top(self.topAnchor, 5)
        containerV.bottom(self.bottomAnchor, -5)
        containerV.right(self.rightAnchor, -10)
        containerV.left(self.leftAnchor, 10)
    }
    
    fileprivate func workImgVConst(){
        containerV.addSubview(workImageView)
        workImageView.top(containerV.topAnchor, 5)
        workImageView.left(containerV.leftAnchor, 10)
        workImageView.right(containerV.centerXAnchor, -50)
        workImageView.bottom(containerV.bottomAnchor, -5)
    }
    
    fileprivate func locationBtnConst(){
        containerV.addSubview(locationBtn)
        locationBtn.top(containerV.topAnchor)
        locationBtn.right(containerV.rightAnchor)
        locationBtn.height(40)
        locationBtn.width(50)
    }
    
    fileprivate func workJobLblConst(){
        containerV.addSubview(workerJobLbl)
        workerJobLbl.left(workImageView.rightAnchor, 10)
        workerJobLbl.right(locationBtn.leftAnchor, -10)
        workerJobLbl.top(containerV.topAnchor, 5)
    }
    
    fileprivate func workStatusLblConst(){
        containerV.addSubview(experienceLbl)
        experienceLbl.right(containerV.rightAnchor, -10)
        experienceLbl.bottom(containerV.bottomAnchor, -10)
        experienceLbl.left(workImageView.rightAnchor, 10)
    }
    
    fileprivate func workPriceLblConst(){
        containerV.addSubview(reytingLbl)
        reytingLbl.bottom(experienceLbl.topAnchor, -5)
        reytingLbl.left(workImageView.rightAnchor, 10)
        reytingLbl.right(containerV.rightAnchor, -10)
    }
    
    fileprivate func workTitleLblConst(){
        
        containerV.addSubview(workerNameLbl)
        workerNameLbl.centerY(containerV.centerYAnchor)
        workerNameLbl.left(workImageView.rightAnchor, 15)
        workerNameLbl.right(containerV.rightAnchor, -5)
    }
}


