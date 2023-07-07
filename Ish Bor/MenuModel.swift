//
//  MenuModel.swift
//  Ish Bor
//
//  Created by Nurillo Domlajonov on 17/02/23.
//

import Foundation
import UIKit

struct Menu {
    
    var title: String
    var imgName: String
    
    init(title: String, imgName: String) {
        self.title = title
        self.imgName = imgName
    }
    
}

var aboutApp = """
    Ushbu ilova iOS va Android telefonlar uchun mo`ljallangan ilova bo`lib, bu ilova ishchi va ish beruvchilarni birlashtiruvchi platforma xisoblanadi.

    Ushbu ilovadan foydalanish orqali o`z kasbingiz bo`yicha ish topib daromadingizni ko`paytirishingiz mumkin bo`ladi.

    Ilova qulayliklari, tez, qulay, ishonchli, tushunishga oson va mutlaqo bepul hisoblanadi.

    Ilova bir qancha tajribali dasturchilar tomonidan ishlab chiqilgan.Sizda qandaydir ilova bo`yicha taklif,shikoyat yoki ilovadagi kamchiliklar to`g`risida ma`lumot bo`lsa asosiy saxifamizdagi ilovadagi hatoliklar bo`limiga yozishingiz mumkin bo`ladi.
"""

struct MenuData{
    
    let tutorialLink = "https://youtu.be/QvvH1HKAEKA"
    let errorsLink   = "https://t.me/\("tashkec1")"
    
    let data: [Menu] = [
        Menu(title: "Mening e'lonlarim", imgName: "myAdds"),
        Menu(title: "Rejimni o`zgartirish", imgName: "employer"),
        Menu(title: "Shaxsiy ma'lumotlar", imgName: "user"),
        Menu(title: "Tilni o`zgartirish", imgName: "translation"),
        Menu(title: "Tunggi rejim", imgName: "dark"),
        Menu(title: "Video qo'llanma", imgName: "tutorial"),
        Menu(title: "Dastur haqida", imgName: "information"),
        Menu(title: "Ilovadagi xatoliklar", imgName: "errors"),
        Menu(title: "Chiqish", imgName: "logout")
    ]
    
    
    func getItems(index: Int)->Menu{
        return data[index]
    }
    
    
    func getSize()->Int{
        return data.count
    }
    
    
    ///url manzilga borish uchun funksiya
    func goLink(url: String){
        let botURL = URL.init(string: url)
        if UIApplication.shared.canOpenURL(botURL!) {
            UIApplication.shared.openURL(botURL!)
        } else {
            let urlAppStore = URL(string: "itms-apps://itunes.apple.com/app/id686449807")
            if(UIApplication.shared.canOpenURL(urlAppStore!))
            {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(urlAppStore!, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(urlAppStore!)
                }
            }
        }
    }
    
}
