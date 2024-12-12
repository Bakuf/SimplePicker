//
//  PickerItem.swift
//  SimplePicker
//
//  Created by Rodrigo Galvez on 11/12/2024.
//

import UIKit
import SwiftUI

public struct PickerItem : Identifiable, Equatable {
    public let id: String
    let imageURL: URL?
    let image: UIImage?
    let smallPreview: UIImage?
    let smallPreviewColor: Color?
    
    public init(id: String = UUID().uuidString,
                  imageURL: URL? = nil,
                  image: UIImage? = nil,
                  smallPreview: UIImage? = nil,
                  smallPreviewColor: Color? = nil) {
        self.id = id
        self.imageURL = imageURL
        self.image = image
        self.smallPreview = smallPreview
        self.smallPreviewColor = smallPreviewColor
    }
    
}

extension PickerItem {
    
    @MainActor public static let demoItems: [PickerItem] = [
        .init(id: "black", imageURL: URL(string: "https://picsum.photos/id/237/300/300"), smallPreviewColor: .black),
        .init(id: "green", imageURL: URL(string: "https://picsum.photos/id/127/300/300"), smallPreviewColor: .green),
        .init(id: "blue", imageURL: URL(string: "https://picsum.photos/id/124/300/300"), smallPreviewColor: .blue),
        .init(id: "red", imageURL: URL(string: "https://picsum.photos/id/63/300/300"), smallPreviewColor: .red),
        .init(id: "orange", imageURL: URL(string: "https://picsum.photos/id/185/300/300"), smallPreviewColor: .orange),
        .init(id: "purple", imageURL: URL(string: "https://picsum.photos/id/249/300/300"), smallPreviewColor: .purple),
    ]
}

