// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct SimplePicker: View {
    public typealias tapCompletion = (PickerItem?) -> Void
    
    let items: [PickerItem]
    let tapCompletion: tapCompletion
    @State var selectedItem: PickerItem?
    
    public init(items: [PickerItem], tapCompletion: @escaping tapCompletion) {
        self.items = items
        self.tapCompletion = tapCompletion
    }
    
    public var body: some View {
        GeometryReader { proxy in
            VStack {
                if let url = selectedItem?.imageURL {
                    AsyncImage(url: url) { image in
                        image.resizable()
                    } placeholder: {
                        if let color = selectedItem?.smallPreviewColor {
                            color
                        }else {
                            Color.red
                        }
                    }
                    .scaledToFit()
                    .frame(width: proxy.size.width,
                           height: proxy.size.width)
                }
                HStack {
                    ForEach(items) { item in
                        if let id = selectedItem?.id, let color = item.smallPreviewColor {
                            Circle()
                                .fill(item.id == id ? .gray : .clear)
                                .frame(width: proxy.size.width / CGFloat(items.count + 1),
                                       height: proxy.size.width / CGFloat(items.count + 1))
                                .overlay {
                                    Circle()
                                        .fill(color)
                                        .frame(width: proxy.size.width / CGFloat(items.count + 1),
                                               height: proxy.size.width / CGFloat(items.count + 1))
                                        .scaleEffect(0.9)
                                        .onTapGesture {
                                            selectedItem = item
                                            self.tapCompletion(item)
                                        }
                                }
                        }
                    }
                }
            }
        }
        .onAppear {
            self.selectedItem = items.count != 0 ? items[0] : nil
        }
    }
}

extension Color: @retroactive Identifiable {
    public var id: Self { self }
}

#Preview {
    SimplePicker(items: PickerItem.demoItems) { item in
        print(item?.id ?? "no item")
    }
}
