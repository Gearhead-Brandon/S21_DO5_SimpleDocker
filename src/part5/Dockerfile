FROM nginx

COPY nginx.conf /etc/nginx/
COPY launch.sh /
COPY server.c /

RUN apt-get update && \ 
    apt-get install -y gcc spawn-fcgi libfcgi-dev && \
    rm -rf /var/lib/apt/lists && \
    gcc server.c -o webserver -lfcgi && \
    chmod +x /launch.sh
    
RUN chown -R nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /home; \
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid

USER nginx
ENTRYPOINT ["./launch.sh"]
