FROM bk203/aws-cli:latest

RUN apk --no-cache add openssl \
	&& wget -q -O kubectl https://storage.googleapis.com/kubernetes-release/release/v1.17.0/bin/linux/amd64/kubectl \
	&& chmod +x kubectl && mv kubectl /usr/local/bin \
	&& wget -q https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz -O - | tar -xz \
	&& chmod +x openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc && mv openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc /usr/local/bin\
	&& rm -rf openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit

WORKDIR /tmp
