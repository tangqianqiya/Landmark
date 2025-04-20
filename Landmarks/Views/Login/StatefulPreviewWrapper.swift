//
//  StatefulPreviewWrapper.swift
//  Landmarks
//
//  Created by Tang Qianqi on 2025/4/19.
//

import SwiftUI

/// 允许在 Previews 中使用 @State 的包装器
struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State private var value: Value
    private let content: (Binding<Value>) -> Content

    init(_ initialValue: Value, @ViewBuilder content: @escaping (Binding<Value>) -> Content) {
        self._value = State(initialValue: initialValue)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}
