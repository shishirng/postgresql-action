FROM docker:stable

COPY create_multiple.sh /docker-entrypoint-initdb.d/
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
RUN chmod +x /docker-entrypoint-initdb.d/create_multiple.sh

ENTRYPOINT ["/entrypoint.sh"]
