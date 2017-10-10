FROM ruby:2.3.3

RUN apt-get update && apt-get install -y \
      git \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/dsk0701/sinatra-app.git /app/docker-lgtm-app
WORKDIR /app/docker-lgtm-app
RUN bundle install

VOLUME /app/docker-lgtm-app/public/images
EXPOSE 4567

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["bundle", "exec", "ruby", "app.rb", "-o", "0.0.0.0", "-p", "4567"]
