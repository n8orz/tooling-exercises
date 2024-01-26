FROM ubuntu:22.04

ADD prs_to_review.sh /prs_to_review.sh

RUN useradd -ms /bin/bash apprunner

RUN apt update \
  && apt install -y wget \
  && apt-get -y install curl \
  && wget -O jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 \ 
  && chmod +x ./jq \
  && cp jq /usr/bin \
  && chown -R apprunner:apprunner /prs_to_review.sh \
  && chmod +x /prs_to_review.sh

USER apprunner
CMD /prs_to_review.sh