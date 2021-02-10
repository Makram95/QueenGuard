//
//  HiveView.swift
//  QueenGuard
//
//  Created by Marc on 10.02.21.
//

import SwiftUI

struct HiveView: View {
    var hive: Hive
    var body: some View {
        Text(hive.hiveName)
    }
}

struct HiveView_Previews: PreviewProvider {
    static var previews: some View {
        HiveView(hive:Hive.example)
    }
}
