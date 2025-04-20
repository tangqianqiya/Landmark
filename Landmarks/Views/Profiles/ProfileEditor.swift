//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Tang Qianqi on 2025/4/17.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            List {
                HStack {
                    Text("Username")
                    Spacer()
                    TextField("Username", text: $profile.username)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.trailing)
                }
                .listRowInsets(EdgeInsets())
                
                Toggle(isOn: $profile.prefersNotifications) {
                    Text("Enable Notifications")
                }
                .listRowInsets(EdgeInsets())
                
                Picker("Gender", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .listRowInsets(EdgeInsets())
                
                DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                    Text("Birthday")
                }
                .listRowInsets(EdgeInsets())
            }
            .scrollContentBackground(.hidden)
            .background(Color.clear)
            .listStyle(.plain)
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
