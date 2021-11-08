FROM ruby:2.3.8

RUN apt-get update && apt-get install -y \
      git \
      wget \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

ENV DOCKERIZE_VERSION v0.5.0
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
      && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
      && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN git clone https://github.com/dsk0701/sinatra-app.git /app/docker-lgtm-app
WORKDIR /app/docker-lgtm-app
RUN bundle install

VOLUME /app/docker-lgtm-app/public/images
EXPOSE 4567

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["bundle", "exec", "ruby", "app.rb", "-o", "0.0.0.0", "-p", "4567"]
