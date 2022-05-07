//
//  InAppProducts.swift
//  GotGenerator
//
//  Created by Ульяна Гритчина on 27.04.2022.
//

import Foundation
import StoreKit

enum InAppProducts: String {
    case arrySupport = "got.support"
    case lannisterSupport = "gotL.support"
    case martellSupport = "gotM.support"
    case tirellSupport = "gotT.support"
}


class InAppPManager: NSObject {
    
    static let shared = InAppPManager()
    private override init() {}
    
    var prodacts: [SKProduct] = []
    
    public func setupPurchases(callback: @escaping(Bool) -> ()) {
        if SKPaymentQueue.canMakePayments() {
            SKPaymentQueue.default().add(self)
            callback(true)
            return
        } else {
            callback(false)
        }
    }
    
    public func getProducts() {
        let identifaers: Set = [
            InAppProducts.arrySupport.rawValue,
            InAppProducts.martellSupport.rawValue,
            InAppProducts.tirellSupport.rawValue,
            InAppProducts.lannisterSupport.rawValue
        ]
        
        let productRequest = SKProductsRequest(productIdentifiers: identifaers)
        productRequest.delegate = self
        productRequest.start()
    }
    
}



extension InAppPManager: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
    }
}



extension InAppPManager: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        self.prodacts = response.products
        prodacts.forEach {
            print("\($0.localizedTitle) - \($0.price)")
        }
        
    }
}
