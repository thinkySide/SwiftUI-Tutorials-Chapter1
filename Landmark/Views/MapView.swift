//
//  MapView.swift
//  Landmark
//
//  Created by 김민준 on 2023/07/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    // View를 자동으로 업데이트 시킬 수 있는 @State 어트리뷰트
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286,
                                       longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2,
                               longitudeDelta: 0.2))
    
    var body: some View {
        
        // @State 변수에 $를 접두사로 지정하여 바인딩을 전달합니다.
        // 기본값에 대한 참조와 같습니다.
        
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(
            latitude: 34.011_286, longitude: -116.166_868)
        )
    }
}
