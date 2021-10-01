//
//  File.swift
//  
//
//  Created by Rafael Valer on 01/10/21.
//

import Foundation

class SinglyLinkedListNode<Element> {
    typealias Node = SinglyLinkedListNode<Element>

    var next: Node?

    var element: Element

    init(next: Node?, element: Element) {
        self.next = next
        self.element = element
    }
}
