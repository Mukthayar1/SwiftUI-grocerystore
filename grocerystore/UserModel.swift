import Foundation
struct UserModel: Identifiable, Equatable ,Codable {
    var id: Int
    var ContactNum: String = ""
    var Email: String = ""
    var LoginStatus: Int = 0
    var ProfileImageURL: String = ""
    var Username: String = ""
    var isDisabled: Int = 0
    var isMsgSubscribed: Int = 0
    var isRider: String = ""
    var isSubscribed: Int = 0
    var createdAt: String = ""
    var updatedAt: String = ""
    var version: String = ""

    // Initialize from a dictionary
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "Id") as? Int ?? 0
        self.ContactNum = dict.value(forKey: "ContactNum") as? String ?? ""
        self.Email = dict.value(forKey: "Email") as? String ?? ""
        self.LoginStatus = dict.value(forKey: "LoginStatus") as? Int ?? 0
        self.ProfileImageURL = dict.value(forKey: "ProfileImageURL") as? String ?? ""
        self.Username = dict.value(forKey: "Username") as? String ?? ""
        self.isDisabled = dict.value(forKey: "isDisabled") as? Int ?? 0
        self.isMsgSubscribed = dict.value(forKey: "isMsgSubscribed") as? Int ?? 0
        self.isRider = dict.value(forKey: "isRider") as? String ?? ""
        self.isSubscribed = dict.value(forKey: "isSubscribed") as? Int ?? 0
        self.createdAt = dict.value(forKey: "createdAt") as? String ?? ""
        self.updatedAt = dict.value(forKey: "updatedAt") as? String ?? ""
        self.version = dict.value(forKey: "version") as? String ?? ""
    }

    static func == (lhs: UserModel, rhs: UserModel) -> Bool {
        return lhs.id == rhs.id
    }
}
