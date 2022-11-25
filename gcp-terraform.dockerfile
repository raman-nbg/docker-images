FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:410.0.0-alpine

ENV TERRAFORM_VERSION 1.3.5

RUN apk --update --no-cache add \
  libc6-compat \
  openssh-client

RUN cd /usr/local/bin && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

WORKDIR /work

CMD ["/bin/bash"]
