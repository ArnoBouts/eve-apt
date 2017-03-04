#!/bin/sh

apt-get update

VERSION=$(apt-cache policy ${PLUGIN_PACKAGE} | grep Candidat | cut -d" " -f4)

cd eve

grep -H -o -r "${PLUGIN_VARIABLE} [^ ]*$" * | while read LINE
do
        FILE=`echo $LINE | cut -d":" -f1`
        OLD=`echo $LINE | cut -d" " -f2`

	if [ "$(dpkg --compare-versions ${OLD} lt ${VERSION} && echo '<')" = "<" ]
	then

	        echo "${FILE} : ${PLUGIN_VARIABLE} : ${OLD} -> ${VERSION}"
	        sed -i -e "s/${PLUGIN_VARIABLE} ${OLD}\$/${PLUGIN_VARIABLE} ${VERSION}/1" ${FILE}

	fi

done

