//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Tang Qianqi on 2025/4/17.
//

import SwiftUI


struct LandmarkRow: View {
    var landmark: Landmark


    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)

            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}


#Preview {
    Group {
        LandmarkRow(landmark: ModelData().landmarks[0])
    }
}
