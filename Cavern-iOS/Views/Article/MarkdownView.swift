//
//  MarkdownView.swift
//  Cavern-iOS
//
//  Created by secminhr on 2021/2/22.
//

import Foundation
import SwiftUI
import WebKit

struct MarkdownView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    let markdown: String
    private let template = """
        <!doctype html>
        <html>
         <head>
          <meta charset="UTF-8">
          <!-- Tocas UI：CSS 與元件 -->
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tocas-ui/2.3.3/tocas.css">
          <!-- Fonts -->
          <link href="https://fonts.googleapis.com/css2?family=Open+Sans&amp;display=swap" rel="stylesheet">
          <link href="https://fonts.googleapis.com/css2?family=Source+Code+Pro&amp;display=swap" rel="stylesheet">
          <!-- jQuery -->
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
          <link rel="stylesheet" href="https://pandao.github.io/editor.md/css/editormd.css">
          <link rel="stylesheet" href="https://stoneapp.tech/cavern/include/css/cavern.css">
         </head>
         <body>
          <div class="ts flatted segment" id="post">
           <div class="markdown" style="display:None">{{markdown_replace}}
           </div>
          </div>
          <script src="https://unpkg.com/load-js@1.2.0"></script>
          <script src="https://stoneapp.tech/cavern/include/js/lib/editormd.js"></script>
          <script src="https://stoneapp.tech/cavern/include/js/markdown.js"></script>
          <script src="https://stoneapp.tech/cavern/include/js/post.js"></script>
         </body>
        </html>
    """
    
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        view.loadHTMLString(template.replacingOccurrences(of: "{{markdown_replace}}", with: markdown), baseURL: URL(string: "https://stoneapp.tech/cavern")!)
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
}
