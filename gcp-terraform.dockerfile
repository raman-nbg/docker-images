FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:410.0.0

ENV TERRAFORM_VERSION 1.3.5

RUN \
  apt-get update -y && \
  apt-get install unzip -y && \
  apt-get install wget -y


################################
# Install Terraform
################################

# Download terraform for linux
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Unzip
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Move to local bin
RUN mv terraform /usr/local/bin/
# Check that it's installed
RUN terraform --version 


# Do not specify an entrypoint. Otherwise, the container would immediately stop after starting.
# https://learn.microsoft.com/en-us/azure/devops/pipelines/process/container-phases?view=azure-devops&tabs=yaml#linux-based-containers
ENTRYPOINT []
