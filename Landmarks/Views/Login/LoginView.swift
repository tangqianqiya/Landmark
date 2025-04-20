//
//  LoginView.swift
//  Landmarks
//
//  Created by Tang Qianqi on 2025/4/19.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        
        ZStack {
            Image("login_bg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.primary)

                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 250)

                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 250)

                Button("Login") {
                    if username == "user" && password == "1234" {
                        isLoggedIn = true
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(30)
            .background(
                RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .background(Color.white.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
            )
            .padding()

        }
        

    }
}

#Preview {
    StatefulPreviewWrapper(false) { isLoggedIn in
        LoginView(isLoggedIn: isLoggedIn)
    }
}

