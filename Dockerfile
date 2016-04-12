FROM ruby:2.3.0
MAINTAINER Tim Cooper <tim.cooper@everydayhero.com>

RUN gem install bundler

ENV HOME /srv/app
RUN mkdir -p $HOME
WORKDIR $HOME

ADD . $HOME/
RUN bundle install
RUN bin/rake install:local

ENTRYPOINT ["schema_dump"]
CMD ["help"]
