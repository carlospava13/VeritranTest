import Foundation

public final class Client: ClientType {
    
    private var id: String
    private var account: AccountType
    
    public init(id: String, account: AccountType) {
        self.id = id
        self.account = account
    }
    
    public func getID() -> String {
        id
    }
    
    public func getAccount() -> AccountType {
        account
    }
}
