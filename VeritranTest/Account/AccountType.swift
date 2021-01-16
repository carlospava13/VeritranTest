import Foundation

public protocol AccountType {
    func deposits(value: Double) throws
    func getBalance() -> Double
    func withdrawsMoney(value: Double) throws -> Double
}
