import UIKit
 
class ChatTableViewCell: UITableViewCell {

    //MARK: - Atributes

    static let identifier:String = "ChatTableViewCell"
        
    lazy var userImage: UIImageView = {
        let userImage = UIImageView()
        userImage.image = UIImage(named: "user")
        userImage.setDimensions(width: 52, height: 52)
        return userImage
    }()
    
    
    lazy var userName:UILabel = {
        let userName = UILabel()
        userName.text = "Melquias"
        userName.font = UIFont.boldSystemFont(ofSize: 16)
        return userName
    }()
    
     lazy var userLastMessage:UILabel = {
        let userLastMessage = UILabel()
         userLastMessage.text = "Bom dia!!!"
         userLastMessage.textColor = .systemGray
        return userLastMessage
    }()
    
    lazy var chevroIcon: UIImageView = {
        let chevroIcon = UIImageView()
        chevroIcon.image = UIImage(systemName: "chevron.right")
        chevroIcon.tintColor = .systemGray
        return chevroIcon
    }()
    
    //MARK: - Inits

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers

    func configureUI(){
        addSubview(userImage)
        userImage.centerY(inView: contentView,leftAnchor: leftAnchor,paddingLeft: 16)
        
        let stackView  = UIStackView(arrangedSubviews: [userName,userLastMessage])
        stackView.axis = .vertical
        stackView.spacing = 8
        addSubview(stackView)
        stackView.centerY(inView: contentView,leftAnchor:  userImage.rightAnchor ,paddingLeft: 16)
        addSubview(chevroIcon)
        chevroIcon.centerY(inView: contentView,leftAnchor:  rightAnchor ,paddingLeft: -30)
              
              
    }
    
}
 
