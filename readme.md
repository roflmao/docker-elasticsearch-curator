# docker-elasticsearch-curator4

This Dockerfile is based on [visity/docker-elasticsearch-curator](https://github.com/visity/docker-elasticsearch-curator). It has been updated to work with Curator 4, which allows you to configure Curator with two config files:

1. `config/curator.yml`: the [Curator config file](https://www.elastic.co/guide/en/elasticsearch/client/curator/current/configfile.html) in which the base configuration of Curator is stored
2. `config/actionfile.yml`: the [Curator action file](https://www.elastic.co/guide/en/elasticsearch/client/curator/current/actionfile.html) in which all all index-filters and actions are defined

When you have created your config files, you can run the container as follows:

	docker run -d -e INTERVAL_IN_HOURS=24 -v /your/local/config_dir:/opt/config --link es1:elasticsearch plindelauf/curator4

This will run the specified actions in every X hours, where X is the value you've given to `INTERVAL_IN_HOURS`.

The link value **es1** is the name of the elasticsearch container.
