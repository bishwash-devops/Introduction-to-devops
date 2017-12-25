#!/bin/bash

# Used when docker run --link is used (deprecated, due to security risks)
#DB_HOST=${MYSQL_PORT_3306_TCP_ADDR}
#DB_PORT=${MYSQL_PORT_3306_TCP_PORT}
#DB_USER=root
#DB_PASSWORD=${MYSQL_ENV_MYSQL_ROOT_PASSWORD}
#DB_NAME=${MYSQL_ENV_MYSQL_DATABASE}

${CATALINA_HOME}/bin/startup.sh && sleep 5 && ${CATALINA_HOME}/bin/shutdown.sh

sed -i -e "s/###DB_HOST###/$DB_HOST/g" -e "s/###DB_PORT###/$DB_PORT/g"  -e "s/###DB_NAME###/$DB_NAME/g" -e "s/###DB_USER###/$DB_USER/g" -e "s/###DB_PASSWORD###/$DB_PASSWORD/g" ${CATALINA_HOME}/webapps/ROOT/WEB-INF/classes/db.properties

exec ${CATALINA_HOME}/bin/catalina.sh run
