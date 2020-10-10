//
//  ViewController.swift
//  Self-Sizing Table View Cell
//
//  Created by Vladislav Tarasevich on 10.10.2020.
//

import UIKit

struct Conversation {
    let title: String
    let preview: String
}

final class ConversationCell: UITableViewCell {
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var conversationLabel: UILabel!
}

final class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!

    let data: [Conversation] = [
        .init(title: "Joe", preview: "Hello World!"),
        .init(title: "Peter Piper", preview: "Mr. Watson I presume"),
        .init(title: "Harry Housefield", preview: "Once upon a time, in a land far away"),
        .init(title: "Sir Roger Martin-Grayson III", preview: "I cannot wait to see what happens next. I do hope they all lived happily ever after.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        guard let headerView = tableView.tableHeaderView else {
            return
        }

        let size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        if headerView.frame.size.height != size.height {
            headerView.frame.size.height = size.height
            tableView.tableHeaderView = headerView
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if let cell = cell as? ConversationCell {
            cell.userImage = UIImageView(image: UIImage(systemName: "person"))
            cell.titleLabel.text = data[indexPath.row].title
            cell.conversationLabel.text = data[indexPath.row].preview
        }
        return cell
    }

}

