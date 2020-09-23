FROM ruby:2.2

ARG user=abuser
RUN apt-get update -qq && apt-get install sudo nodejs -qq
RUN useradd -u1000 -Gsudo -s/bin/bash $user
RUN echo "$user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $user
RUN sudo mkdir $HOME
RUN sudo chown $user $HOME

WORKDIR /application
ENTRYPOINT [ "./entrypoint.sh" ]
