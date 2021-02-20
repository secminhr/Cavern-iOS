//
//  Cavern_iOSApp.swift
//  Cavern-iOS
//
//  Created by secminhr on 2021/2/16.
//

import SwiftUI

@main
struct Cavern_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(list: articlePreviewResponseSample.posts)
        }
    }
}
