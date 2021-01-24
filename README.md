![](https://cdn.iconscout.com/icon/free/png-256/ruby-47-1175102.png)

# Nauka programowania w języku Ruby

Jest to repozytorium, w którym zebrałem rzeczy przydatne do nauki języka Ruby oraz obsługi GitHuba. Tak naprawde większość jest od Radka. W każdym razie przydatne linki zostały zebrane i przedstawione ponizej:

[LInstalacja GitHub oraz obsługa podstawowych funkcjonalności](https://www.howtoforge.com/tutorial/install-git-and-github-on-ubuntu/ "github_ubuntu_instalation")

[Dodanie klucza SSH do konta GitHub](https://www.inmotionhosting.com/support/server/ssh/how-to-add-ssh-keys-to-your-github-account/ "add_ssh_to_gh")

[Instalacja Ruby](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-18-04 "ruby_ubuntu_instalation")

[Ruby Warrior - Gra edukacyjna](http://tutorials.jumpstartlab.com/projects/ruby_warrior.html "ruby_warrior")

[Nauka składni języka Ruby (Learn X in Y)](https://learnxinyminutes.com/docs/ruby/ "learn_x_in_y")

### Dodatkowe oprogramowanie

[Tmate](https://tmate.io/ "tmate")


### Zamiana Ruby na RBENV

Usuniecie ruby jak juz bylo zainstalowane wczesniej
>sudo apt-get remove ruby   

Instalacja RBENV
>cd $HOME   
>sudo apt-get update    
>sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev    

>git clone https://github.com/rbenv/rbenv.git ~/.rbenv   
>echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc   
>echo 'eval "$(rbenv init -)"' >> ~/.bashrc   
>exec $SHELL   

>git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build   
>echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
>exec $SHELL   

Tu mozna dac inna wersje, a nawet trzeba, po to jest RBENV   

>rbenv install 2.7.0    
>rbenv global 2.7.0   
>ruby -v     

Instalacja bundlera
>gem install bundler   
>rbenv rehash   
