import XCTest
@testable import AddressMocker

final class AddressMockerTests: XCTestCase {
	func testCreateValidAM() throws {
		XCTAssertNoThrow(try AddressMocker(usingIPv4: "127.0.0.1"))
		XCTAssertNoThrow(try AddressMocker(usingIPv4: "192.168.1.1"))
		XCTAssertNoThrow(try AddressMocker(usingIPv4: "8.8.8.8"))
		XCTAssertNoThrow(try AddressMocker(usingIPv4: "4.4.4.4"))
		XCTAssertNoThrow(try AddressMocker(usingIPv4: "255.255.255.255"))
	}

	func testCreateInvalidAM() throws {
		XCTAssertThrowsError(try AddressMocker(usingIPv4: "invalid"))
	}

	func testAMIntegerValue() throws {
		XCTAssertEqual(try AddressMocker(usingIPv4: "127.0.0.1").integer, 0x100007F)
		XCTAssertEqual(try AddressMocker(usingIPv4: "192.168.1.1").integer, 16885952)
		XCTAssertEqual(try AddressMocker(usingIPv4: "8.8.8.8").integer, 134744072)
		XCTAssertEqual(try AddressMocker(usingIPv4: "4.4.4.4").integer, 67372036)
		XCTAssertEqual(try AddressMocker(usingIPv4: "10.0.0.1").integer, 16777226)
		XCTAssertEqual(try AddressMocker(usingIPv4: "255.255.255.255").integer, 4294967295)
	}

	func testAMBooleanValue() throws {
		XCTAssertEqual(try AddressMocker(usingIPv4: "127.0.0.1").boolean, false)
		XCTAssertEqual(try AddressMocker(usingIPv4: "192.168.1.1").boolean, true)
		XCTAssertEqual(try AddressMocker(usingIPv4: "8.8.8.8").boolean, true)
		XCTAssertEqual(try AddressMocker(usingIPv4: "4.4.4.4").boolean, true)
		XCTAssertEqual(try AddressMocker(usingIPv4: "10.0.0.1").boolean, true)
		XCTAssertEqual(try AddressMocker(usingIPv4: "255.255.255.255").boolean, false)
	}
}
