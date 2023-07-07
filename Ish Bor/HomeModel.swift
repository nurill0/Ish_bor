//
//  HomeModel.swift
//  Ish Bor
//
//  Created by Nurillo Domlajonov on 23/03/23.
//

import Foundation
import Combine
struct User{
    let name: String
    let phone: Int
}

let users = [
  User(name: "Santosh", phone: 1234567890),
  User(name: "Sparsh", phone: 1234567892),
  User(name: "Aditya", phone: 1234567891)
]

let usersPublisher = users.publisher

struct Worker {
    let name: String
    let job: String
    let rayting: String
    let experience: String
    let imageName: String
    
    init(name: String, job: String, rayting: String, experience: String, imageName: String) {
        self.name = name
        self.job = job
        self.rayting = rayting
        self.experience = experience
        self.imageName = imageName
    }
}

struct WorkerData{
    
    let data: [Worker] = [
        Worker(name: "Nurillo Domlajonov", job: "Elektrik", rayting: "⭐️⭐️⭐️⭐️", experience: "1 yil", imageName: "plumber"),
        Worker(name: "Baxodirov Abbos", job: "Santexnik", rayting: "⭐️⭐️⭐️", experience: "2 yil", imageName: "electiric"),
        Worker(name: "Muminov Ikrom", job: "Texnik Usta", rayting: "⭐️⭐️", experience: " 1 oy", imageName: "technical"),
        Worker(name: "Xusniddin Sobirov", job: "Texnik usta", rayting: "⭐️⭐️⭐️⭐️⭐️", experience: "5 yil", imageName: "technical"),
        Worker(name: "Xusniddin Sobirov", job: "Texnik usta", rayting: "⭐️⭐️⭐️⭐️⭐️", experience: "5 yil", imageName: "technical"),
        Worker(name: "Xusniddin Sobirov", job: "Texnik usta", rayting: "⭐️⭐️⭐️⭐️⭐️", experience: "5 yil", imageName: "technical"),
    ]
    
    
    func getSize()->Int{
        return data.count
    }
    
    func getItems(index: Int)->Worker{
        return data[index]
    }
}



struct Work {
    let title: String
    let job: String
    let price: String
    let status: String
    let imageName: String
    
    init(title: String, job: String, price: String, status: String, imageName: String) {
        self.title = title
        self.job = job
        self.price = price
        self.status = status
        self.imageName = imageName
    }
   
}

struct WorkData{
    
    let data: [Work] = [
       Work(title: "Yangi uy elektr mantaj ishlarini bajarish kerak", job: "Elektirik", price: "1 000 000 so`m", status: "Faol", imageName: "electiric"),
       Work(title: "Yangi uy oshxonaga issiq sovuq suv mantaj ishlari", job: "Santexnik", price: "3 000 000 so`m", status: "Bajarilmoqda", imageName: "electiric"),
       Work(title: "Konditsioner va muzlatkich ishlamay qoldi", job: "Texnik usta", price: "2 000 000 so`m", status: "Bajarildi", imageName: "electiric"),
    ]
    
    
    func getSize()->Int{
        return data.count
    }
    
    func getItems(index: Int)->Work{
        return data[index]
    }
}
