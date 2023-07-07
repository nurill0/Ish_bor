//
//  SelectedWorkerVC.swift
//  Ish Bor
//
//  Created by Nurillo Domlajonov on 26/04/23.
//

import UIKit
import GoogleMaps

class SelectedWorkerVC: BaseController, CLLocationManagerDelegate {
    
    lazy var customBtn: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "backIcon")?.withTintColor(.baseColor(), renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(backAction))
    
    lazy var itemView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .workPlaceBg()
        
        return view
    }()
    
    
    lazy var swipeBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .baseColor()
        btn.setImage(UIImage(systemName: "arrow.down")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        btn.layer.cornerRadius = 12
        btn.addTarget(self, action: #selector(swipeAction), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var workerJobLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Elektrik"
        lbl.font = UIFont(name: "Futura-Bold", size: 22)
        lbl.textAlignment = .left
        lbl.textColor = .titleModeColors()
        lbl.numberOfLines = 2
        
        return lbl
    }()
    
    lazy var addressLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "📍 Andijon shahar 2-shimoliy kichik daxa"
        lbl.font = UIFont(name: "Futura", size: 14)
        lbl.textAlignment = .left
        lbl.textColor = .gray
        lbl.numberOfLines = 1
        
        return lbl
    }()
    
    
    lazy var workerReytingLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Reyting: ⭐️⭐️⭐️⭐️"
        lbl.font = UIFont(name: "Futura-Medium", size: 15)
        lbl.textAlignment = .left
        lbl.textColor = .titleModeColors()
        lbl.numberOfLines = 1
        
        return lbl
    }()
    
    
    lazy var experienceLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Tajriba: 2 oy"
        lbl.font = UIFont(name: "Futura-Medium", size: 15)
        lbl.textAlignment = .left
        lbl.textColor = .titleModeColors()
        lbl.numberOfLines = 1
        
        return lbl
    }()
    
//    lazy var descriptionLbl: UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "Yangi uyga elektr mantaj ishlarini qilish kerak.Hamma kerakli narsalar olib kelingan ish boshlashga tayyor holda"
//        lbl.font = UIFont(name: "Futura", size: 15)
//        lbl.textAlignment = .left
//        lbl.textColor = .gray
//        lbl.numberOfLines = 3
//
//        return lbl
//    }()
    
    lazy var getWorkJobItem: GetJobWorkItemView = {
        let view = GetJobWorkItemView(icon: "person.fill", username: "Nurillo Domlajonov", job: "Elektrik", rating: "3.9", btnTitle: "Ishchini chaqirish")
        view.messageBtn.addTarget(self, action: #selector(openChat), for: .touchUpInside)
        view.callBtn.addTarget(self, action: #selector(call), for: .touchUpInside)

        return view
    }()
    
    let mapView = GMSMapView()
    var isVisible = true
    var locationManager = CLLocationManager()
}



extension SelectedWorkerVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

      
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = UIColor.titleModeColors()
        navigationItem.setLeftBarButton(customBtn, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
    }
    
}


extension SelectedWorkerVC{
    
    @objc func openChat(){
        let vc = ChatVC()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func call(){
        if let url = URL(string: "tel://\(+998905459343)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @objc func backAction(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func swipeAction(){
        if isVisible {
            swipeBtn.setImage(UIImage(systemName: "arrow.up")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
            itemView.transform = CGAffineTransform(translationX: 0, y: itemView.frame.height)
            mapView.transform = CGAffineTransform(translationX: 0, y: itemView.frame.height)
            mapView.frame = view.frame
            
            swipeBtn.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height>=740 ? itemView.frame.height-30 : itemView.frame.height-50)
        }else{
            swipeBtn.setImage(UIImage(systemName: "arrow.down")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
            itemView.transform = .identity
            swipeBtn.transform = .identity
            mapView.transform = .identity
        }
        isVisible.toggle()
    }
    
    
}


extension SelectedWorkerVC{
    
    fileprivate func configureUI(){
        changeFont()
        logoImgView.isHidden = true
        pageTitleLbl.isHidden = true
        view.backgroundColor = #colorLiteral(red: 0.9433212876, green: 0.9532695413, blue: 0.9573990703, alpha: 1)
        baseContainerV.backgroundColor  =  #colorLiteral(red: 0.9433212876, green: 0.9532695413, blue: 0.9573990703, alpha: 1)
        itemViewConst()
        mapViewConst()
        swipeBtnConst()
        workTitleLblConst()
        addressLblConst()
        priceLblConst()
        jobTitleLblConst()
//        descriptionLblConst()
        getJobWorkItemViewConst()
    }
    
    fileprivate func changeFont(){
        if view.frame.height >= 670 && view.frame.height>740 {
            workerJobLbl.font = UIFont(name: "Futura-Bold", size: 19)
            experienceLbl.font  = UIFont(name: "Futura-Medium", size: 16)
            getWorkJobItem.height(170)
        }else if view.frame.height>670&&view.frame.height<740{
            getWorkJobItem.height(150)
            workerJobLbl.font = UIFont(name: "Futura-Bold", size: 18)
            experienceLbl.font  = UIFont(name: "Futura-Medium", size: 15)
        }
        else{
            workerJobLbl.font = UIFont(name: "Futura-Bold", size: 17)
            experienceLbl.font  = UIFont(name: "Futura-Bold", size: 15)
            getWorkJobItem.userNameLbl.font = UIFont(name: "Futura-Bold", size: 14)
            getWorkJobItem.jobLbl.font = UIFont(name: "Futura", size: 12)
            getWorkJobItem.ratingLbl.font = UIFont(name: "Futura", size: 12)
            getWorkJobItem.height(120)
            getWorkJobItem.userIcon.height(40)
            getWorkJobItem.userIcon.width(40)
            getWorkJobItem.userIcon.layer.cornerRadius = 20
            getWorkJobItem.callBtn.height(40)
            getWorkJobItem.callBtn.width(40)
            getWorkJobItem.callBtn.layer.cornerRadius = 20
            getWorkJobItem.messageBtn.height(40)
            getWorkJobItem.messageBtn.width(40)
            getWorkJobItem.messageBtn.layer.cornerRadius = 20
        }
    }
    
    
    fileprivate func mapViewConst(){
        
        let camera = GMSCameraPosition.camera(withLatitude: 40.815356, longitude: 72.28375, zoom: 15.0)
        //        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.baseContainerV.addSubview(mapView)
        mapView.camera = camera
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.top(baseContainerV.topAnchor)
        mapView.right(baseContainerV.rightAnchor)
        mapView.left(baseContainerV.leftAnchor)
        mapView.bottom(itemView.topAnchor)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 40.324323, longitude:   41.43520)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
    
    
    fileprivate func itemViewConst(){
        baseContainerV.addSubview(itemView)
        itemView.top(baseContainerV.centerYAnchor, -20)
        itemView.right(baseContainerV.rightAnchor)
        itemView.left(baseContainerV.leftAnchor)
        itemView.bottom(baseContainerV.bottomAnchor)
    }
    
    
    fileprivate func swipeBtnConst(){
        baseContainerV.addSubview(swipeBtn)
        swipeBtn.centerY(itemView.topAnchor, 10)
        swipeBtn.right(baseContainerV.rightAnchor, -60)
        swipeBtn.width(70)
        swipeBtn.height(40)
    }
    
    
    fileprivate func workTitleLblConst(){
        itemView.addSubview(workerJobLbl)
        workerJobLbl.top(swipeBtn.bottomAnchor, 10)
        workerJobLbl.left(itemView.leftAnchor, 20)
        workerJobLbl.right(itemView.rightAnchor, -10)
    }
    
    fileprivate func addressLblConst(){
        itemView.addSubview(addressLbl)
        addressLbl.top(workerJobLbl.bottomAnchor, 10)
        addressLbl.left(workerJobLbl.leftAnchor)
        addressLbl.right(workerJobLbl.rightAnchor)
    }
    
    
    fileprivate func priceLblConst(){
        itemView.addSubview(workerReytingLbl)
        workerReytingLbl.top(addressLbl.bottomAnchor, 30)
        workerReytingLbl.left(workerJobLbl.leftAnchor)
        workerReytingLbl.right(workerJobLbl.rightAnchor)
    }
    
    fileprivate func jobTitleLblConst(){
        itemView.addSubview(experienceLbl)
        experienceLbl.top(workerReytingLbl.bottomAnchor, 10)
        experienceLbl.right(workerJobLbl.rightAnchor)
        experienceLbl.left(workerJobLbl.leftAnchor)
    }
    
//    fileprivate func descriptionLblConst(){
//        itemView.addSubview(descriptionLbl)
//        descriptionLbl.top(jobTitleLbl.bottomAnchor, 5)
//        descriptionLbl.right(itemView.rightAnchor, -10)
//        descriptionLbl.left(itemView.leftAnchor, 10)
//    }
    
    
    fileprivate func getJobWorkItemViewConst(){
        itemView.addSubview(getWorkJobItem)
        getWorkJobItem.bottom(itemView.bottomAnchor, -30)
        getWorkJobItem.right(experienceLbl.rightAnchor)
        getWorkJobItem.left(experienceLbl.leftAnchor)
    }
    
}
