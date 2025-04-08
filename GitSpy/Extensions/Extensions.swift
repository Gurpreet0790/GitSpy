//
//  UIApplication+Extensions.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-07.
//


// MARK: - UIApplication Extensions

import UIKit
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil, from: nil, for: nil)
    }
}

// MARK: - View Modifier Extensions
extension View {
    // MARK: - Image Style
    func imageStyle(width: CGFloat, height: CGFloat) -> some View {
        self.modifier(ImageModifier(width: width, height: height))
    }
    
    // MARK: - Icon Style
    func iconStyle(foregroundColor: Color = .gray) -> some View {
        self.modifier(IconModifier(foregroundColor: foregroundColor))
    }
    
    // MARK: - Text Style
    func textStyle(fontSize: Font = .title3, fontWeight: Font.Weight = .bold, textColor: Color = .white) -> some View {
        self.modifier(TextModifier(fontSize: fontSize, fontWeight: fontWeight, textColor: textColor))
    }
    
    // MARK: - Text Field Style
    func textFieldStyle(foregroundColor: Color = .white, disableAutocorrection: Bool = true) -> some View {
        self.modifier(TextFieldModifier(foregroundColor: foregroundColor, disableAutocorrection: disableAutocorrection))
    }
    
    // MARK: - No User View Style
    func noUserViewStyle() -> some View {
        self.modifier(NoUserViewModifier())
    }
    
    // MARK: - Progress View Style
    func progressViewStyle() -> some View {
        self.modifier(progressViewModifier())
    }
    
    // MARK: - Search View Style
    func searchViewStyle() -> some View {
        self.modifier(searchViewModifier())
    }
    
    // MARK: - User Follows Count View Style
    func userFollowsCountViewStyle() -> some View {
        self.modifier(UserFollowsCountViewModifier())
    }
    
    // MARK: - User Name List View Style
    func userNameListViewStyle() -> some View {
        self.modifier(UserNameListModifier())
    }
    
    // MARK: - Theme View Style
    func themeViewStyle() -> some View {
        self.modifier(ThemeViewModifier())
    }
}
