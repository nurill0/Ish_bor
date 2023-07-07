//
//  WorkCell.swift
//  Ish Bor
//
//  Created by Nurillo Domlajonov on 15/02/23.
//x

import UIKit
import MapKit

class WorkerWorkCell: UICollectionViewCell {
    
    static let identifier = "workCell"
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
        btn.setImage(UIImage(named: "location")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
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
    
    
    lazy var workTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Yangi hisoblagich o`rnatish va mantaj ishlarini olib borish kerak stolbaga chiqish".maxLength(length: 75)
        lbl.textAlignment = .left
        lbl.font =  UIFont(name: "Futura-Bold", size: 18)
        lbl.textColor =  .titleModeColors()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 4
        
        return lbl
    }()
    
    lazy var workStatusLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Faol"
        lbl.textAlignment = .right
        lbl.font = .systemFont(ofSize: 16, weight: .medium)
        lbl.textColor =  #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        
        return lbl
    }()
    
    lazy var workPriceLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "100 000 so'm"
        lbl.textAlignment = .right
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.textColor =  .titleModeColors()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        
        return lbl
    }()
    
    
    let mapView = MKMapView()
    
    @objc func openMap(){
        self.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.top(self.topAnchor)
        mapView.bottom(self.bottomAnchor)
        mapView.right(self.rightAnchor)
        mapView.left(self.leftAnchor)
    }
    
    func getItemsForCell(job: String, workTitle: String, workPrice: String, workStatus: String, workImgName: String) {
        self.workerJobLbl.text = job
        self.workTitleLbl.text = workTitle.maxLength(length: 75)
        self.workPriceLbl.text = workPrice
        self.workStatusLbl.text = workStatus
        self.workImageView.image = UIImage(named: workImgName)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if workStatusLbl.text == "Faol" {
            workStatusLbl.textColor =  #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        }else{
            workStatusLbl.textColor = .red
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
}




extension WorkerWorkCell {
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
        containerV.addSubview(workStatusLbl)
        workStatusLbl.right(containerV.rightAnchor, -10)
        workStatusLbl.bottom(containerV.bottomAnchor)
        workStatusLbl.left(workImageView.rightAnchor, 10)
    }
    
    fileprivate func workPriceLblConst(){
        containerV.addSubview(workPriceLbl)
        workPriceLbl.bottom(workStatusLbl.topAnchor)
        workPriceLbl.left(workImageView.rightAnchor, 5)
        workPriceLbl.right(containerV.rightAnchor, -5)
    }
    
    fileprivate func workTitleLblConst(){
        
        containerV.addSubview(workTitleLbl)
        workTitleLbl.centerY(containerV.centerYAnchor)
        workTitleLbl.left(workImageView.rightAnchor, 15)
        workTitleLbl.right(containerV.rightAnchor, -5)
    }
}

extension String {
   func maxLength(length: Int) -> String {
       var str = self
       let nsString = str as NSString
       if nsString.length >= length {
           str = nsString.substring(with:
               NSRange(
                location: 0,
                length: nsString.length > length ? length : nsString.length)
           )
       }
       return  str
   }
}
