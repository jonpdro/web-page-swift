//
//  ContentView.swift
//  WebPage
//
//  Created by João Pedro on 04/08/22.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    @State private var selectedSegment = 0
    @State private var webSites = ["www.google.com", "www.github.com"]
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Picker(selection: $selectedSegment, label: Text("Selecione aqui!")) {
                        ForEach(0 ..< webSites.count) {
                            Text(self.webSites[$0]).tag($0)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                WebView(request: URLRequest(url: URL(string: "https://\(webSites[selectedSegment])")!))
            }.navigationTitle(Text("WebPages"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// WebView
struct WebView: UIViewRepresentable {
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}
