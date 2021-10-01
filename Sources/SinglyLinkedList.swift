//
//  File.swift
//  
//
//  Created by Rafael Valer on 30/09/21.
//

import Foundation

public struct SinglyLinkedList<Element> {
    typealias Node = SinglyLinkedListNode<Element>

    private var head: Node?

    private var tail: Node?

    /// The number of elements in the linked list.
    public private(set) var count: Int

    /// Retrieves the first element of the list.
    public var front: Element? {
        return head?.element
    }

    /// Retrieves the last element of the list.
    public var back: Element? {
        return tail?.element
    }

    /// Creates a new instance of an empty `SinglyLinkedList`.
    public init() {
        self.count = 0
        self.head = nil
        self.tail = nil
    }

    /// Creates a new instance of a `SinglyLinkedList` and add the input elements to it.
    ///
    /// - Complexity: O(n), where n is the number of elements in the input list.
    ///
    /// - Parameter elements: The input elements to be added to the linked list.
    public init(elements: [Element]) {
        self.init()

        if elements.count > 0 {
            elements.forEach { add(atBack: $0) }
        }
    }

    /// Returns the linked list as an array.
    ///
    /// - Complexity: O(n), where n is the number of elements in the list.
    ///
    /// - Returns: An array with all the list elements.
    public func asArray() -> [Element]? {
        guard count > 0 else { return nil }

        var result: [Element] = []
        var current = head
        while(current != nil) {
            result.append(current!.element)
            current = current?.next
        }

        return result
    }

    /// Inserts an element to the beginning of the list.
    ///
    /// - Complexity: O(1).
    ///
    /// - Parameter element: The element to be added.
    mutating public func add(atFront element: Element) {
        let node = Node(next: nil, element: element)
        count += 1

        guard head != nil else {
            self.head = node
            self.tail = node
            return
        }

        node.next = head
        head = node
    }

    /// Inserts an element to the end of the list.
    ///
    /// - Complexity: O(1).
    ///
    /// - Parameter element: The element to be added.
    mutating public func add(atBack element: Element) {
        let node = Node(next: nil, element: element)
        count += 1

        guard tail != nil else {
            self.head = node
            self.tail = node
            return
        }

        tail?.next = node
        tail = node
    }

    /// Removes the element at the beginning of the list.
    ///
    /// - Complexity: O(1).
    ///
    /// - Returns: The removed element.
    mutating public func removeAtFront() -> Element? {
        guard head != nil else {
            return nil
        }

        let node = head
        if head === tail {
            head = nil
            tail = nil
        } else {
            head = head?.next
        }

        count -= 1
        node?.next = nil
        return node?.element
    }

    /// Removes the element at the end of the list.
    ///
    /// - Complexity: O(n), where n is the number of elements in the list.
    ///
    /// - Returns: The removed element.
    mutating public func removeAtBack() -> Element? {
        guard tail != nil else {
            return nil
        }

        let node = tail
        if head === tail {
            head = nil
            tail = nil
        } else {
            var current = head
            while(current?.next !== tail) {
                current = current?.next
            }
            current?.next = nil
            tail = current
        }

        return node?.element
    }
}
