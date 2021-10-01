import XCTest
@testable import Algos

final class SinglyLinkedListTests: XCTestCase {

    private var sut: SinglyLinkedList<Int>!

    override class func setUp() {
        super.setUp()
    }

    override class func tearDown() {
        super.tearDown()
    }

    func test_init() {
        sut = SinglyLinkedList()

        XCTAssertEqual(sut.count, 0)
        XCTAssertNil(sut.front)
        XCTAssertNil(sut.back)
    }

    func test_initFromArray() {
        sut = SinglyLinkedList(elements: [1, 2, 3, 4, 5, 6])

        XCTAssertEqual(sut.count, 6)
        XCTAssertEqual(sut.front, 1)
        XCTAssertEqual(sut.back, 6)
    }

    func test_convertAsArray() {
        let elements = [1, 2, 3, 4, 5, 6]
        sut = SinglyLinkedList(elements: elements)

        XCTAssertEqual(elements, sut.asArray())
    }

    func test_addAtFront() {
        sut = SinglyLinkedList()

        sut.add(atFront: 1)
        XCTAssertEqual(sut.front, 1)
        XCTAssertEqual(sut.back, 1)

        sut.add(atFront: 2)
        XCTAssertEqual(sut.front, 2)
        XCTAssertEqual(sut.back, 1)

        sut.add(atFront: 3)
        XCTAssertEqual(sut.front, 3)
        XCTAssertEqual(sut.back, 1)
    }

    func test_addAtBack() {
        sut = SinglyLinkedList()

        sut.add(atBack: 1)
        XCTAssertEqual(sut.front, 1)
        XCTAssertEqual(sut.back, 1)

        sut.add(atBack: 2)
        XCTAssertEqual(sut.front, 1)
        XCTAssertEqual(sut.back, 2)

        sut.add(atBack: 3)
        XCTAssertEqual(sut.front, 1)
        XCTAssertEqual(sut.back, 3)
    }

    func test_removeAtFront() {
        sut = SinglyLinkedList(elements: [1, 2, 3, 4])

        XCTAssertEqual(sut.removeAtFront(), 1)
        XCTAssertEqual(sut.front, 2)

        XCTAssertEqual(sut.removeAtFront(), 2)
        XCTAssertEqual(sut.front, 3)

        XCTAssertEqual(sut.removeAtFront(), 3)
        XCTAssertEqual(sut.front, 4)

        XCTAssertEqual(sut.removeAtFront(), 4)
        XCTAssertNil(sut.front)
    }

    func test_removeAtBack() {
        sut = SinglyLinkedList(elements: [1, 2, 3, 4])

        XCTAssertEqual(sut.removeAtBack(), 4)
        XCTAssertEqual(sut.back, 3)

        XCTAssertEqual(sut.removeAtBack(), 3)
        XCTAssertEqual(sut.back, 2)

        XCTAssertEqual(sut.removeAtBack(), 2)
        XCTAssertEqual(sut.back, 1)

        XCTAssertEqual(sut.removeAtBack(), 1)
        XCTAssertNil(sut.back)
    }
}
