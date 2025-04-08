//
//  ViewModifiers.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-06.
//

import Foundation
import SwiftUI

// MARK: - Image Modifiers
struct ImageModifier: ViewModifier {
    var width: CGFloat
    var height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: width, height: height)
            .cornerRadius(15)
    }
}

// MARK: - Icon Modifiers
struct IconModifier: ViewModifier {
    var foregroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(foregroundColor)
    }
}

// MARK: - Text Modifiers
struct TextModifier: ViewModifier {
    var fontSize: Font
    var fontWeight: Font.Weight
    var textColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(fontSize)
            .fontWeight(fontWeight)
            .foregroundColor(textColor)
    }
}

// MARK: - Text Modifiers
struct TextFieldModifier: ViewModifier {
    var foregroundColor: Color
    var disableAutocorrection: Bool
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(foregroundColor)
            .autocapitalization(.none)
            .disableAutocorrection(disableAutocorrection)
    }
}

// MARK: - User Name List Modifier
struct UserNameListModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22, weight: .bold, design: .rounded))
            .foregroundStyle(
                LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing)
            )
    }
}

// MARK: - No User View Modifier
struct NoUserViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground).opacity(0.9))
    }
}

// MARK: - Progress View Modifier
struct progressViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .padding()
    }
}
   
// MARK: - Search View Modifier
struct searchViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8)
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}
    
// MARK: - User Follows Count Modifier
struct UserFollowsCountViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
    }
}

// MARK: - Theme Modifier
struct ThemeViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .preferredColorScheme(.dark)
    }
}

