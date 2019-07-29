# docker-grafana-with-druid


Creates a grafana docker image with this plugin for Druid installed https://github.com/grafana-druid-plugin/druidplugin

The latest version of the plugin wasn't released to the Grafana plugin repo so easiest/hackiest way to do it was this :)

To build run

`docker build -t grafana:with-druid-plugin --build-arg "GRAFANA_VERSION=latest" --build-arg "GF_INSTALL_PLUGINS=abhisant-druid-datasource" .`

Adding extra plugins will also work, so just include them on the GF_INSTALL_PLUGINS property as well.

PS - It should probably use a sub-module to reference the other repo... but that is for another day.