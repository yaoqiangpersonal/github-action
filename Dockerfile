FROM wonderd/jre-alpine
WORKDIR application
COPY --from=builder application/dependencies/ ./
COPY --from=builder application/snapshot-dependencies/ ./
COPY --from=builder application/spring-boot-loader/ ./
COPY --from=builder application/application/ ./
ENV TZ="Asia/Shanghai"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
ENV JVM_OPTS="-XX:MaxRAMPercentage=80.0" \
 	JAVA_OPTS="-Dfile.encoding=utf8 -Xmx512m" \
 	NACOS_HOST="nacos:8848" \
 	NAMESPACE_ID="6937773b-63e4-4f61-afcd-91591d10b04d" \
 	PROFILES_ACTIVE="pro"
ENTRYPOINT ["sh","-c","java $JVM_OPTS $JAVA_OPTS org.springframework.boot.loader.JarLauncher"]