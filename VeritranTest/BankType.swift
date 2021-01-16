import Foundation

public protocol BankType {
    var clients: [ClientType] { get set }
    func add(client: ClientType)
    func deposits(id: String,value: Double) throws
    func withdrawsMoney(id: String,value: Double) throws -> Double
    func getBalance(id: String) throws -> Double
}
