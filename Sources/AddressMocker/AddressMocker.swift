// AddressMocker
// Support library for Testing and Mocking services.

import Foundation
import Network
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public enum AddressMockerError: Error {
	case invalidAddress
}

public struct AddressMocker {
	let IPv4: IPv4Address

	public init(usingIPv4 address: String) throws {
		guard let address = IPv4Address(address) else {
			throw AddressMockerError.invalidAddress
		}
		self.IPv4 = address
	}

	public var integer: UInt32 {
		IPv4.rawValue.withUnsafeBytes { $0.load(as: UInt32.self) }
	}

	public var boolean: Bool {
		self.integer.isMultiple(of: 2)
	}
}
