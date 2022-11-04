FROM docker.io/ubuntu:jammy
MAINTAINER Konstantinos Kottikas, github.com/kkottikas/

### Set locale to C.UTF-8
ENV LANG='C.UTF-8' \
    LANGUAGE='C.UTF-8' \
    LC_ALL='C.UTF-8' \
    IMAGE_NAME="kkottikas/docker-insync" \
    IMAGE_REPO_URL="https://github.com/kkottikas/docker-insync"

    ### Install required packages
RUN apt-get update && \
	apt-get install -y curl gnupg dialog cron apt-utils cron lsb-release
	
    ### Install Insync
RUN	curl -O https://cdn.insynchq.com/builds/linux/insync-headless_3.2.6.10745-buster_amd64.deb && \
	apt-get install -y ./insync-headless_3.2.6.10745-buster_amd64.deb

    ### Cleanup
RUN apt-get autoremove -y && apt-get -y clean 

	### install scripts
COPY ./insync_init.sh /
RUN chmod a+x /insync_init.sh

# initialize Insync
CMD /insync_init.sh 
