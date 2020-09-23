//
//  LCDView.swift
//  Mini Player
//
//  Created by Nate Thompson on 9/22/20.
//

import SwiftUI

struct LCDView: View {
    var body: some View {
        Rectangle()
            .fill(Color.red)
            .frame(height: 44)
            .padding(.top, 10)
            .padding(.bottom, 10)
    }
}

struct LCDView_Previews: PreviewProvider {
    static var previews: some View {
        LCDView()
    }
}
