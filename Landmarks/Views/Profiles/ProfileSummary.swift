//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Tang Qianqi on 2025/4/17.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile


    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)


                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Gender: \(profile.seasonalPhoto.rawValue)")
                Text("Birthday: ") + Text(profile.goalDate, style: .date)
            }
        }
    }
}


#Preview {
    ProfileSummary(profile: Profile.default)
}
