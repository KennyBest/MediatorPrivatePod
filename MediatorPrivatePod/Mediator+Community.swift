//
//  Mediator+Community.swift
//  MediatorPrivatePod
//
//  Created by Kede on 2018/12/19.
//  Copyright © 2018 Clare. All rights reserved.
//

import UIKit

extension Mediator {
    static func communityViewController() -> UIViewController? {
        return Mediator.shared.targetViewController(module: "CommunityPrivatePod", className: "CommunityViewController", params: nil)
    }
}
