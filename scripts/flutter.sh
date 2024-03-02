#! /bin/bash

git clone https://github.com/flutter/flutter.git -b stable ~/flutter
~/flutter/bin/flutter precache
~/flutter/bin/flutter doctor

read -rp "Press any key to continue" _