//
//  LandmarkList.swift
//  Landmark
//
//  Created by 김민준 on 2023/07/21.
//

import SwiftUI

struct LandmarkList: View {
    
    var body: some View {
        
        // MARK: - [첫번째 방법] List 생성 : KeyPath 이용 방법
        
        // \Landmark.id -> KeyPath
        // 주로 바인딩을 위해서 사용됨.
        // 속성에 대한 참조를 해 속성의 값을 가져옴.
        
        // landmarks 배열을 돌며 생성
        // id가 있어야함.(Unique 해야 한다는 의미)
        
        // List(landmarks, id: \Landmark.id) { landmark in
        //    LandmarkRow(landmark: landmark)
        // }
        
        
        // MARK: - [두번째 방법] : Identifier 프로토콜 준수
        
        // 따로 KeyPath(id)를 작성하지 않아줘도 됨.
        // (이미 Unique한 값이라는 context가 있기 때문)
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink {
                    // Destination
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks") // List에다가 달아줘야함!
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        
        let devices = [
            "iPhone 14 Pro",
            "iPhone SE (3rd generation)",
            "iPad Air (5th generation)",
        ]
        
        // \.self 키워드??
        // -> Collection에서 각 항목을 나타내는 KeyPath값을 지정해주기 위해 사용.
        // -> 각 항목이 자동으로 유일한 식별자로 사용됨.
        // -> 간단한 값들을 표시할 때 유용하게 사용.
        // 아래에서는 devices 배열의 각 요소를 식별하고 있음.
        
        ForEach(devices, id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        
        // 상단 Scheme 메뉴에서 rawValue 확인이 가능하다. (없는 건 안댐)
    }
}
