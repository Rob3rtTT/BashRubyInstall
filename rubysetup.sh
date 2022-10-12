#!/bin/bash

echo "Enter your linux user:"
read username
mkdir ~/Ruby_Install
cd ~/Ruby_Install
sudo apt update
sudo apt install git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
sleep 1
source ~/.bashrc

# sleep 1
# type rbenv
# sleep 10
# type rbenv > typerbenv.txt

# diff ~/BashRubyInstall/rbenvoutput.txt typerbenv.txt
# file_output=$?
# if [ $file_output -eq 0 ]
# then
#     echo 'Output is the same as expected'
#     echo 'Continuing...'
#     rm ~/BashRubyInstall/rbenvoutput.txt typerbenv.txt
#     sleep 1
# else
#     echo 'Output is not as expected'
#     exit 1
# fi

rubyenv=$(which type rbenv)
if [[ $rubyenv =~ '/home/rtipter/.rbenv/bin/rbenv' ]]; then
    echo 'Continuing...'
    sleep 2
else
    echo 'Error'
    exit 1
fi

git clone https://github.com/rbenv/ruby-build.git
sleep 2
rbenv install -l
echo 'Which version from the list would you like to install? Please type in version like this 3.1.x'.
read rbversion
rbenv install $rbversion
sleep 2
rbenv global $rbversion
sleep 2
echo "gem: --no-document" > ~/.gemrc
gem install bundler

rubybuild=$(gem env home)
if [[ $rubybuild =~ "/home/$USER/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0" ]]; then
    echo 'true'
else
    echo 'false'
fi

echo 'Which Rails version would you like to install?'
read railsversion
gem install rails -v $railsversion
rbenv rehash
railsversion=$(rails -v)
if [[ $railsversion =~ "Rails $railsversion" ]]; then
    echo 'true'
else
    echo 'false'
fi
cd ~/.rbenv
git pull

gem install pry
