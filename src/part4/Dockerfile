FROM nginx

COPY nginx.conf /etc/nginx/
COPY launch.sh /
COPY server.c /

RUN apt-get update && \ 
    apt-get install -y gcc spawn-fcgi libfcgi-dev && \
    gcc server.c -o webserver -lfcgi && \
    chmod +x /launch.sh
    
ENTRYPOINT ["./launch.sh"]
