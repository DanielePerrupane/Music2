//
//  AccountViewModel.swift
//  Music2
//
//  Created by Daniele Perrupane on 29/11/23.
//

import Foundation

class AccountViewModel : ObservableObject {
    var accounts = [
    Account(name: "Daniele", surname: "Perrupane", age: "28", gender: "M", image: "account")
    ]
}
