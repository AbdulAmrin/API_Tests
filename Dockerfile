FROM fedora:29

MAINTAINER Abdul Amrin  <amlin786@yahoo.com>
LABEL description Robot Framework in Docker.

# Setup volume for output
VOLUME /opt/robotframework/reports

# Setup X Window Virtual Framebuffer
ENV SCREEN_COLOUR_DEPTH 24
ENV SCREEN_HEIGHT 1080
ENV SCREEN_WIDTH 1920

# Set number of threads for parallel execution
# By default, no parallelisation
ENV ROBOT_THREADS 1

# Dependency versions
ENV PABOT_VERSION 0.53
ENV PYTHON_PIP_VERSION 18.0*
ENV REQUESTS_VERSION 0.5.0
ENV ROBOT_FRAMEWORK_VERSION 3.1.1
ENV XVFB_VERSION 1.20.*

# Install system dependencies
RUN dnf upgrade -y \
  && dnf install -y \
    python2-pip-$PYTHON_PIP_VERSION \
    xauth \
    nodejs \
    xorg-x11-server-Xvfb-$XVFB_VERSION \
    which \
    ImageMagick-devel \
    wget \
    git-all \
  && dnf clean all 
  
RUN yum install -y zbar
RUN yum install -y curl

# Install RobotFramework and dependent libraries
RUN pip install \
  robotframework==$ROBOT_FRAMEWORK_VERSION \
  simplejson \
  awscli \
  pyotp==2.2.7 \
  pyzbar \
  pyzbar[scripts] \
  testrail \
  robotframework-imaplibrary \
  robotframework-excellibrary \
  robotframework-reportportal \
  reportportal-client \
  robotframework-pabot==$PABOT_VERSION \
  robotframework-requests==$REQUESTS_VERSION \
  robotframework-jsonlibrary 
 
  



# Prepare binaries to be executed
COPY bin/run-tests-in-virtual-screen.sh /opt/robotframework/bin/
COPY test  /opt/robotframework/tests

# Update system path
ENV PATH=/opt/robotframework/bin:$PATH

# Execute all robot tests
CMD ["run-tests-in-virtual-screen.sh"]



