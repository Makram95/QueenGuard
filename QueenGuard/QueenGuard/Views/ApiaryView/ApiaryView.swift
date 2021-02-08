//
//  ApiaryView.swift
//  QueenGuard
//
//  Created by Marc on 01.02.21.
//

import SwiftUI

struct ApiaryView: View {
    
    @ObservedObject var apiary: Apiary
    
    var body: some View {
        List{
            ForEach(apiary.apiaryHives){hive in
                Text(hive.hiveName)
            }
        }
    }
}

struct ApiaryView_Previews: PreviewProvider {
    static var previews: some View {
        ApiaryView(apiary: Apiary.example)
    }
}
