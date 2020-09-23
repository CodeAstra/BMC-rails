FROM ruby:2.2

ARG user=abuser
# RUN apt-get update -qq && apt-get install -qq apt-transport-https ca-certificates
# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
# RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update -qq && apt-get install sudo nodejs -qq
RUN useradd -u1000 -Gsudo -s/bin/bash $user
RUN echo "$user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $user
RUN sudo mkdir $HOME
RUN sudo chown $user $HOME

WORKDIR /application
ENTRYPOINT [ "./entrypoint.sh" ]
