//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Tang Qianqi on 2025/4/17.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Landmarks")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                }.padding(.horizontal)
                
                List {
                    Toggle(isOn: $showFavoritesOnly){
                        Text("Favorite Only")
                    }
                    
                    ForEach(filteredLandmarks){
                        landmark in
                        NavigationLink{
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                    
                }
                .animation(.default, value: filteredLandmarks)
                .listStyle(.plain)
                
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview {
    LandmarkList().environment(ModelData())
}
