FROM docker.insops.net/instructure/node:latest

USER root
ENV APP_HOME /usr/src/app
RUN mkdir -p $APP_HOME
ADD . $APP_HOME
WORKDIR $APP_HOME
RUN npm install
RUN chown -R docker:docker $APP_HOME

USER docker
EXPOSE 9000

CMD ["bin/startup"]
