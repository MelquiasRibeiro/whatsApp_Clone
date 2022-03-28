import UIKit

class ChatsController: UIViewController {
    //MARK: - Atributes
    
    let searchBar: UISearchBar = UISearchBar()

    lazy var editbutton:UIBarButtonItem = {
        let editbutton = UIBarButtonItem()
        editbutton.title = "edit"
        editbutton.style =  .plain
        editbutton.target = self
        editbutton.action = nil
        editbutton.tintColor = .systemBlue

        return editbutton
    }()
    
    
    lazy var newChatButton:UIBarButtonItem = {
        let newChatButton = UIBarButtonItem()
        newChatButton.image = UIImage(systemName: "square.and.pencil")
        newChatButton.style =  .plain
        newChatButton.target = self
        newChatButton.action = nil
        newChatButton.tintColor = .systemBlue
        newChatButton.action = #selector(contactsNavigate)

        return newChatButton
    }()
    
    
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
        return tableView
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.costumizeTabBar()
        self.view.addSubview(self.tableView)
        self.configTableViewConstraints()
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
   }
    
    //MARK: - Helpers

    @objc func contactsNavigate () {
        print("Navigation")
    }
    
    func costumizeTabBar(){
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.rightBarButtonItem = newChatButton
        navigationItem.leftBarButtonItem = editbutton
        title = "Chats"
        
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        
        tableView.tableHeaderView = searchBar

    }
   
   
    
    private func configTableViewConstraints(){
          NSLayoutConstraint.activate([
              
              self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
              self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
              self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
              self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),

          ])
      }
    
}

extension ChatsController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else {return UITableViewCell()}
              
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
    
    
}
