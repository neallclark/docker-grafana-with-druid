ARG GRAFANA_VERSION="latest"

FROM grafana/grafana:${GRAFANA_VERSION}

USER root

ARG GF_INSTALL_IMAGE_RENDERER_PLUGIN="false"

ENV GF_PATHS_PLUGINS="/var/lib/grafana-plugins"

RUN mkdir -p "$GF_PATHS_PLUGINS" 
    #&& \
    #chown -R grafana:grafana "$GF_PATHS_PLUGINS"

RUN if [ $GF_INSTALL_IMAGE_RENDERER_PLUGIN = "true" ]; then \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --no-cache  upgrade && \
    apk add --no-cache udev ttf-opensans chromium && \
    rm -rf /tmp/* && \
    rm -rf /usr/share/grafana/tools/phantomjs; \
fi

#USER grafana

ENV GF_RENDERER_PLUGIN_CHROME_BIN="/usr/bin/chromium-browser"

RUN if [ $GF_INSTALL_IMAGE_RENDERER_PLUGIN = "true" ]; then \
    grafana-cli \
        --pluginsDir "$GF_PATHS_PLUGINS" \
        --pluginUrl https://github.com/grafana/grafana-image-renderer/releases/latest/download/plugin-linux-x64-glibc-no-chromium.zip \
        plugins install grafana-image-renderer; \
fi

ARG GF_INSTALL_PLUGINS=""

RUN if [ ! -z "${GF_INSTALL_PLUGINS}" ]; then \
    OLDIFS=$IFS; \
        IFS=','; \
    for plugin in ${GF_INSTALL_PLUGINS}; do \
        IFS=$OLDIFS; \
        grafana-cli --pluginsDir "$GF_PATHS_PLUGINS" plugins install ${plugin}; \
    done; \
fi


#RUN grafana-cli --pluginsDir "$GF_PATHS_PLUGINS" --pluginUrl https://github.com/yesoreyeram/grafana-infinity-datasource/releases/download/v0.6.0-alpha3/yesoreyeram-infinity-datasource-0.6.0.zip plugins install yesoreyeram-infinity-datasource


COPY druidplugin /var/lib/grafana-plugins/abhisant-druid-datasource/
COPY grafana-meta-queries /var/lib/grafana-plugins/grafana-meta-queries/
COPY yesoreyeram-infinity-datasource /var/lib/grafana-plugins/yesoreyeram-infinity-datasource/
COPY mosaic-grafana-datasource /var/lib/grafana-plugins/mosaic-grafana-datasource/
COPY mosaic-grafana-graph /var/lib/grafana-plugins/mosaic-grafana-graph/
