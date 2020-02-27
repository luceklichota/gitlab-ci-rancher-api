FROM lachlanevenson/k8s-kubectl:v1.11.6 AS k8scli
FROM rancher/cli:v2.0.4
COPY --from=k8scli /usr/local/bin/kubectl /usr/local/bin

ENV BUILD_DEPS="gettext"  \
    RUNTIME_DEPS="libintl"

RUN set -x && \
    apk add --update $RUNTIME_DEPS && \
    apk add --virtual build_deps $BUILD_DEPS &&  \
    cp /usr/bin/envsubst /usr/local/bin/envsubst && \
    apk del build_deps

RUN mkdir ~/.rancher
RUN touch ~/.rancher/cli2.json
RUN echo 'Folder created'

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

COPY credentials.sh /usr/bin/credentials.sh
RUN chmod +x /usr/bin/credentials.sh
RUN /usr/bin/credentials.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
