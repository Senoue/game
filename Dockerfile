# ベースとなる親のDockerfileを指定。
# Docker Hubで提供されているOfficial Repositoryから、CentOS6.8をベースにして構築する。
# https://hub.docker.com/_/centos/
FROM senoue/vm-gae:v1

LABEL maintainer="Hiromasa SENOUE <senoue.hiromasa@videomarket.co.jp>"

# 作業ディレクトリを作成。
WORKDIR /data

### 設定をして起動 #######################################################
# DOCKER RUN実行時に/sbin/initが実行されるようにする。
ENV GOPATH /data
ENV PATH /data/doc_root/service/jcg-api/go/bin:$PATH
ENV APPENGINE_DEV_APPSERVER /usr/bin/dev_appserver.py
ENV GOROOT /usr/lib64/google-cloud-sdk/platform/google_appengine/goroot-1.9
ENV PATH=$PATH:$GOROOT/bin
RUN chmod +x /usr/lib64/google-cloud-sdk/platform/google_appengine/goroot-1.9/bin/goapp

ENTRYPOINT /sbin/init
