#!/bin/sh
# Setup Tornado 
# Run only after running ~/setup.sh.  Run instead of ~/bin/setup-whirlwind.sh

cd ~bin && mkdir Tornado && mkdir HTML5

cd ~/bin/Tornado
git clone git://github.com/facebook/tornado.git
git clone git://github.com/mongodb/mongo-python-driver.git
git clone git://github.com/bitly/asyncmongo.git
git clone git://github.com/enaeseth/swirl.git
#git clone git://github.com/trendrr/whirlwind.git

cd ~/bin/HTML5
git clone git://github.com/paulirish/html5-boilerplate.git
git clone git://github.com/shichuan/mobile-html5-boilerplate.git
git clone git://github.com/paulirish/html5-boilerplate-server-configs.git
git clone git://github.com/dhgamache/Skeleton.git
