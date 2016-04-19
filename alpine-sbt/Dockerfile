FROM quay.io/vnadgir_ef/alpine-javabase

RUN apk update && apk upgrade && apk add curl && rm -rfv /var/cache/apk/* /tmp/*

# Download SBT
ENV SBT_VERSION="0.13.11"
RUN curl -L -O "https://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/$SBT_VERSION/sbt-launch.jar"
RUN mv sbt-launch.jar /usr/local/bin/

# Install SBT
RUN echo '#!/bin/bash -xe' > sbt
RUN echo 'SBT_OPTS="-Xms256M -Xmx768M -Xss1M -XX:+CMSClassUnloadingEnabled"' >> sbt
RUN echo 'SBT_PARAMS="$@"' >> sbt
RUN echo '/bin/bash -c "java $SBT_OPTS -jar /usr/local/bin/sbt-launch.jar $SBT_PARAMS"' >> sbt
RUN chmod +x sbt
RUN mv sbt /usr/local/bin/

# Install gatling plugin
ENV GATLING_VERSION="2.1.7"
RUN mkdir -p ~/.sbt/0.13/plugins/
RUN echo "addSbtPlugin(\"io.gatling\" % \"gatling-sbt\" % \"$GATLING_VERSION\")" > ~/.sbt/0.13/plugins/gatling.sbt

# Initialize SBT
RUN sbt about

ENTRYPOINT ["sbt"]
