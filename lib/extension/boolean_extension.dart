//
// Created by BlackRose on 19/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

extension BooleanNullExtension on bool? {
  int toInt() {
    var result = this??false;
    return result ? 1 : 0;
  }
}
extension BooleanExtension on bool {
  int toInt() {
    var result = this??false;
    return result ? 1 : 0;
  }
}