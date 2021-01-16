import Foundation

public final class Bank: BankType {
  
    public var clients: [ClientType] = [ClientType]()
    
    public init() { }
    
    public func add(client: ClientType) {
        clients.append(client)
    }
    
    public func deposits(id: String,value: Double) throws {
        do {
            let client = try getClientAbout(id: id)
            try client.getAccount().deposits(value: value)
        } catch {
            throw error
        }
    }
    
    public func withdrawsMoney(id: String,value: Double) throws -> Double {
        do {
            let client = try getClientAbout(id: id)
            return try client.getAccount().withdrawsMoney(value: value)
        } catch {
            throw error
        }
    }
    
    public func getBalance(id: String) throws -> Double {
        do {
            let client = try getClientAbout(id: id)
            return client.getAccount().getBalance()
        } catch {
            throw BankError.NotFoundClient
        }
    }
    
    
    private func getClientAbout(id: String) throws -> ClientType {
        guard let id = clients.first(where: { $0.getID() == id }) else {
            throw BankError.NotFoundClient
        }
        return id
    }
}
