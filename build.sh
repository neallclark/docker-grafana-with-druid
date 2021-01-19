docker build -t grafana:with-druid-plugin-25.0 --build-arg "GRAFANA_VERSION=7.1.2" --build-arg "GF_INSTALL_PLUGINS=grafana-worldmap-panel,grafana-clock-panel,grafana-piechart-panel,satellogic-3d-globe-panel,aceiot-svg-panel,ryantxu-ajax-panel,btplc-alarm-box-panel,michaeldmoore-annunciator-panel,farski-blendstat-panel,yesoreyeram-boomtable-panel,yesoreyeram-boomtheme-panel,digiapulssi-breadcrumb-panel,digrich-bubblechart-panel,speakyourcode-button-panel,cloudspout-button-panel,neocat-cal-heatmap-panel,petrslavotinek-carpetplot-panel,briangann-gauge-panel,briangann-datatable-panel,jdbranham-diagram-panel,natel-discrete-panel,dalvany-image-panel,marcusolsson-dynamictext-panel,larona-epict-panel,agenty-flowcharting-panel,citilogics-geoloop-panel,aidanmountford-html-panel,michaeldmoore-multistat-panel,natel-plotly-panel,ae3e-plotly-panel,magnesium-wordcloud-panel,abhisant-druid-datasource" .
docker tag grafana:with-druid-plugin-25.0 dkrmosaic.hartreepartners.com/hartreepartners/grafana:with-druid-plugin-25.0
docker push dkrmosaic.hartreepartners.com/hartreepartners/grafana:with-druid-plugin-25.0