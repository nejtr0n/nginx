FROM nginx:latest
MAINTAINER Jimmy Nejtr0n <a6y@xakep.ru>
ENV CONSUL_TEMPLATE_VERSION 0.14.0
ENV CONSUL_URL consul:8500
ENV HAPROXY_TEMPLATE nginx.ctmpl
RUN apt-get update && apt-get install -y unzip
RUN rm -rf /etc/nginx/conf.d/default.conf
ADD start.sh /bin/start.sh
ADD https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip /
RUN unzip consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip  
RUN mv consul-template /usr/local/bin/consul-template 
RUN rm -rf /consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip
ENTRYPOINT ["/bin/start.sh"]
