FROM ruby:2.3.0
MAINTAINER Tim Cooper <tim.cooper@everydayhero.com>

RUN sed -i -e 's,http\(redir\)\?.debian.\(org\|net\),cloudfront.debian.net,' /etc/apt/sources.list

RUN gem install bundler

ENV HOME /srv/app
RUN mkdir -p $HOME
WORKDIR $HOME

ADD . $HOME/
RUN bundle install
RUN bin/rake install:local
