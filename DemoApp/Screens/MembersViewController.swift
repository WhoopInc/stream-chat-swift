//
// Copyright © 2024 Stream.io Inc. All rights reserved.
//

import Nuke
import StreamChat
import UIKit

typealias UserCell = NameGroupViewController.UserCell

class MembersViewController: UITableViewController, ChatChannelMemberListControllerDelegate {
    let membersController: ChatChannelMemberListController
    private var members: [ChatChannelMember] = []

    init(membersController: ChatChannelMemberListController) {
        self.membersController = membersController
        super.init(style: .insetGrouped)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        membersController.delegate = self
        tableView.register(UserCell.self, forCellReuseIdentifier: UserCell.reuseIdentifier)
        synchronizeAndUpdateData()
    }

    private func synchronizeAndUpdateData() {
        membersController.synchronize { [weak self] _ in
            self?.updateData()
        }
    }

    private func updateData() {
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        members.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.reuseIdentifier) as? UserCell else {
            return UITableViewCell()
        }

        let member = members[indexPath.row]
        if let imageURL = member.imageURL {
            Nuke.loadImage(with: imageURL, into: cell.avatarView)
        }
        cell.nameLabel.text = member.name
        cell.removeButton.isHidden = true
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let member = members[indexPath.row]
        dump(member)
    }

    func memberListController(_ controller: ChatChannelMemberListController, didChangeMembers changes: [ListChange<ChatChannelMember>]) {
        members = Array(controller.members)
        updateData()
    }
}
