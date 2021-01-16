import Foundation

public final class Account: AccountType {
    
    private var money: Double = 0.0
    
    public init() {}
    
    public func deposits(value: Double) throws {
        if value > 0 {
            money += value
        } else {
            throw AccountError.DoesNotAllowNegativeValue
        }
    }
    
    public func withdrawsMoney(value: Double) throws -> Double {
        if money >= value && value > 0 {
            money -= value
            return value
        } else {
            throw AccountError.IsNotPosibleTransacction
        }
    }
    
    public func getBalance() -> Double {
        money
    }
}
