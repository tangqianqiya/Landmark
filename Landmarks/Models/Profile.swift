//
//  Profile.swift
//  Landmarks
//
//  Created by Tang Qianqi on 2025/4/17.
//

import Foundation


struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.male
    var goalDate = Date()


    static let `default` = Profile(username: "tangqianqi")


    enum Season: String, CaseIterable, Identifiable {
        case male = "👨"
        case female = "👩"


        var id: String { rawValue }
    }
}
