// AddressMocker
// Support library for Testing and Mocking services.

import Foundation

public enum AddressMockerError: Error {
	case invalidAddress
}

public struct AddressMocker {
	let IPv4: String
	let octets: [UInt8]

	public init(usingIPv4 address: String) throws {
		self.octets = address.components(separatedBy: ".")
			.compactMap { UInt8($0) }
			.filter { $0 >= 0 && $0 <= 255 }
		guard octets.count == 4 else {
			throw AddressMockerError.invalidAddress
		}
		self.IPv4 = address
	}

	public var integer: UInt32 {
		return // Little Endian
			(UInt32(octets[0]) << (0*8)) |
			(UInt32(octets[1]) << (1*8)) |
			(UInt32(octets[2]) << (2*8)) |
			(UInt32(octets[3]) << (3*8))
	}

	public var boolean: Bool {
		self.integer.isMultiple(of: 2)
	}
}
