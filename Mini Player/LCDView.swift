//
//  LCDView.swift
//  Mini Player
//
//  Created by Nate Thompson on 9/22/20.
//

import SwiftUI

struct LCDView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color(.sRGB, red: 0.85, green: 0.85, blue: 0.86))
                .offset(y: 1)
            
            RoundedRectangle(cornerRadius: 5)
                .fill(LinearGradient(gradient: Gradient(colors: [
                    Color(.sRGB, red: 0.93, green: 0.94, blue: 0.88),
                    Color(.sRGB, red: 0.87, green: 0.89, blue: 0.78)
                ]), startPoint: .top, endPoint: .bottom))
            
            LCDContentView()
                .padding(1)
            
            RoundedRectangle(cornerRadius: 5)
                .stroke()
                .shadow(color: .black, radius: 1, x: 0, y: 0)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color(.sRGB, red: 0.49, green: 0.49, blue: 0.45))

        }
        .frame(height: 44)
        .padding(.top, 10)
        .padding(.bottom, 9)
    }
}

struct LCDView_Previews: PreviewProvider {
    static var previews: some View {
        LCDView()
            .frame(width: 200)
    }
}
