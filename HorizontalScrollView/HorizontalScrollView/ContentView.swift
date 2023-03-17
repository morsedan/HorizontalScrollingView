//
//  ContentView.swift
//  HorizontalScrollView
//
//  Created by Dan Morse on 3/16/23.
//

import SwiftUI

struct Item: Identifiable {
    let name: String
    let image: Image
    let action: () -> Void
    var id: String
    
    init(name: String, image: Image, action: @escaping () -> Void) {
        self.name = name
        self.image = image
        self.action = action
        self.id = name
    }
    
    static func theAction(name: String) {
        print("Tapped!: \(name)")
    }
    
    static let item1 = Item(name: "First Item", image: Image(systemName: "pencil"), action: {
        Item.theAction(name: "First Item")
    })
    static let item2 = Item(name: "Second Item", image: Image(systemName: "circle"), action: {
        Item.theAction(name: "Second Item")
    })
    static let item3 = Item(name: "Third Item", image: Image(systemName: "pencil"), action: {
        Item.theAction(name: "Third Item")
    })
    static let item4 = Item(name: "Fourth Item", image: Image(systemName: "circle"), action: {
        Item.theAction(name: "Fourth Item")
    })
    static let item5 = Item(name: "Fifth Item", image: Image(systemName: "pencil"), action: {
        Item.theAction(name: "Fifth Item")
    })
    static let item6 = Item(name: "Sixth Item", image: Image(systemName: "circle"), action: {
        Item.theAction(name: "Sixth Item")
    })
    
    static let items = [Item.item1, Item.item2, Item.item3, Item.item4, Item.item5, Item.item6]
}

struct ContentView: View {
    let items = Item.items
    let size: CGFloat = 28
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(items) { item in
                    Button(action: item.action) {
                        VStack {
                            item.image
                                .resizable()
                                .frame(width: size, height: size)
                                .padding(18)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 6).stroke(.gray)
                                }
                                .foregroundColor(.purple)
                            Text(item.name).font(.caption)
                                .foregroundColor(.gray)
                                .padding(.bottom)
                                .fixedSize(horizontal: false, vertical: true)
                                .lineLimit(1...2)
                                .frame(maxWidth: 64)
                        }
                    }
                }
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 12, trailing: 8))
        }
        .scrollIndicators(.hidden)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
