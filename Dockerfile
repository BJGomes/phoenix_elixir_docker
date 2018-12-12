FROM elixir:1.7.4

# install hex package manager
RUN mix local.hex --force
RUN mix local.rebar --force

# install the phoenix 1.3.4
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new-1.3.4.ez --force

# create app folder
RUN mkdir /myapp
WORKDIR /myapp
COPY . /myapp

RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install -y nodejs

RUN apt-get install -y inotify-tools

RUN cd assets && npm install && node node_modules/brunch/bin/brunch build

COPY . /myapp