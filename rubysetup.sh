#! bin/bash
rubyenv=$(which type rbenv)
rubybuild=$(gem env home)
railsversion=$(rails -v)


mkdir ~/Ruby_Install
cd ~/Ruby_Install
sudo apt update
sudo apt install git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
if [[ $rubyenv =~ '/usr/bin/rbenv' ]]; then
    echo 'Continuing...'
else
    echo 'Error'
fi
git clone https://github.com/rbenv/ruby-build.git
rbenv install -l
echo 'Which version from the list would you like to install? Please type in version like this 3.1.x'.
read rbversion
rbenv install $rbversion
rbenv global $rbversion
echo "gem: --no-document" > ~/.gemrc
gem install bundler
if [[ $rubybuild =~ "/home/$USER/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0" ]]; then
    echo 'true'
else
    echo 'false'
fi

echo 'Which Rails version would you like to install?'
read railsversion
gem install rails -v $railsversion
rbenv rehash
if [[ $railsversion =~ "Rails $railsversion" ]]; then
    echo 'true'
else
    echo 'false'
fi
cd ~/.rbenv
git pull
