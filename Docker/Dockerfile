FROM httpd:latest
MAINTAINER Akhil Raj

COPY index.html /usr/local/apache2/htdocs/
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh

EXPOSE 80
# CMD ["httpd-foreground"]
ENTRYPOINT ["docker-entrypoint.sh"]