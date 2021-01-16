import Foundation

public protocol ClientType {
    init(id: String, account: AccountType)
    func getID() -> String
    func getAccount() -> AccountType
}
