FROM centos
MAINTAINER bassemzohdy
EXPOSE 8080
RUN yum -y update
RUN yum -y install which zip unzip
RUN yum -y install java-1.8.0-openjdk-devel
RUN curl -s "https://get.sdkman.io" | bash
RUN echo '@RestController class App {@RequestMapping("/") String hello() {"Hello World!\n"}}' >app.groovy
RUN source "$HOME/.sdkman/bin/sdkman-init.sh";echo "y"|sdk install springboot;
ENTRYPOINT $HOME/.sdkman/candidates/springboot/1.4.0.RELEASE/bin/spring run app.groovy
