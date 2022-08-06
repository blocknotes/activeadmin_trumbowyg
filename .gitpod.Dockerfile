FROM gitpod/workspace-ruby-2
# FROM gitpod/workspace-full-vnc

USER gitpod

RUN sudo install-packages chromium-browser libnss3

RUN wget "https://chromedriver.storage.googleapis.com/104.0.5112.79/chromedriver_linux64.zip"
RUN unzip chromedriver_linux64.zip
RUN sudo mv chromedriver /usr/local/bin/
