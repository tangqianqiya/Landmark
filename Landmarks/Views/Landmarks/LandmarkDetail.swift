//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Tang Qianqi on 2025/4/17.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    
    // 添加状态变量来跟踪当前语言
    @State private var isChineseLanguage = false
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    // 添加计算绑定属性
    var isFavorite: Binding<Bool> {
        Binding(
            get: { modelData.landmarks[landmarkIndex].isFavorite },
            set: { modelData.landmarks[landmarkIndex].isFavorite = $0 }
        )
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    // 使用计算绑定属性
                    FavoriteButton(isSet: isFavorite)
                    
                    Spacer()
                    
                    // 添加语言切换按钮
                    Button(action: {
                        isChineseLanguage.toggle()
                    }) {
                        Text(isChineseLanguage ? "EN" : "中")
                            .font(.subheadline)
                            .padding(8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                }
                
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Text(landmark.state)
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text(isChineseLanguage ? (landmark.chineseDescription ?? "暂无中文描述") : landmark.description)
                    .padding(.top)
                    .padding(.bottom)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
