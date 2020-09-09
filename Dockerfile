FROM ruby:2.7.1-alpine

RUN apk update && apk add bash build-base nodejs postgresql-dev tzdata

RUN mkdir /qconcursos
WORKDIR /qconcursos

COPY Gemfile Gemfile.lock ./
RUN gem install bundler --no-document
RUN bundle install --no-binstubs --jobs $(nproc) --retry 3

COPY . /qconcursos

# Add a script to be executed every time the container starts.
COPY bin/docker/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["bin/docker/entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
