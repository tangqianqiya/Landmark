//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Tang Qianqi on 2025/4/17.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Featured")
                        .font(.largeTitle)
                        .bold()

                    Spacer()

                    Button {
                        showingProfile.toggle()
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                .padding(.horizontal)

                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })

                List {
                    ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    }
                    .listRowInsets(EdgeInsets())
                }
                .listStyle(.inset)
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}

