//
//  FontViewModifier.swift
//  CityWeather
//
//  Created by amy on 2024-11-23.
//
import SwiftUI

struct CustomStyleModifier: ViewModifier {
    var textStyle: Font.TextStyle
    
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Poppins-Medium", size: fontSize(for: textStyle)))
    }
    
    private func fontSize(for textStyle: Font.TextStyle) -> CGFloat {
        
        switch textStyle {
            
        case .headline: return 30       // No City Selected
        case .subheadline: return 15    // Please Search For A City
        
        case .title: return 30          // Selected City
        case .title2: return 70         // Temparature
            
        case .caption: return 12        // Humidity, UV, Feels Like
        case .caption2: return 15       // 20%, 4, 38°
            
        case .callout: return 15        // Search Bar Text
        case .title3: return 20         // Selected City (in Search List)
        case .body: return 60           // Temparature (in Search List)
                
        default: return 12
        }
    }
}

extension View {
    func customFont(_ textStyle: Font.TextStyle) -> some View {
        self.modifier(CustomStyleModifier(textStyle: textStyle))
    }
}
