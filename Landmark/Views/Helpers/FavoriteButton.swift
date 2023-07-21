//
//  FavoriteButton.swift
//  Landmark
//
//  Created by 김민준 on 2023/07/21.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }

    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
        
        // .constant?
        // -> 바인딩의 표시로 $true라는 표현이 없어서
        // 요렇게 표시해줘야함.
    }
}
