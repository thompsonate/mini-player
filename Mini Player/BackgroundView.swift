//
//  BackgroundView.swift
//  Mini Player
//
//  Created by Nate Thompson on 9/23/20.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(.sRGB, red: 0.90, green: 0.90, blue: 0.90),
                Color(.sRGB, red: 0.58, green: 0.60, blue: 0.61)
            ]), startPoint: .top, endPoint: .bottom)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
            .frame(width: 332, height: 63)
    }
}
