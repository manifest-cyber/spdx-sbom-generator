# SPDX-License-Identifier: Apache-2.0

FROM alpine
ENV USERNAME=spdx-sbom-generator
# Ruby
RUN apk add --update ruby && gem install bundler

# Go
RUN apk add go

# Java
RUN apk add --update maven

# Node
RUN apk add --update nodejs npm && npm install -g yarn

COPY spdx-sbom-generator_*.apk /tmp/
RUN ls -ial /tmp
RUN apk add --no-cache --allow-untrusted /tmp/spdx-sbom-generator_*.apk

ENTRYPOINT ["spdx-sbom-generator"]

CMD ["-h"]
