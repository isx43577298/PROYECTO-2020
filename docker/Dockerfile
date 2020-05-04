# Gustavo Tello
# EDT-M14 PROJECTE SELINUX
# Dockerfile

FROM fedora:27
LABEL version="1.0"
LABEL author="@isx43577298 ASIX-M14"
LABEL subject="projecte SELinux"
RUN dnf -y install vim policycoreutils policycoreutils-python selinux-policy selinux-policy-targeted libselinux-utils setroubleshoot-server setools setools-console mcstrans openssh-server
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/startup.sh
WORKDIR /opt/docker



