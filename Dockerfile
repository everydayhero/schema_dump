FROM ruby:2.3.0
MAINTAINER Tim Cooper <tim.cooper@everydayhero.com>

ENV HOME /srv/app
WORKDIR $HOME

ADD . $HOME/
RUN bundle install
RUN bin/rake install:local

ENTRYPOINT ["schema_dump"]
CMD ["help"]
