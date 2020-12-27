#!/bin/sh
# NOW=$(date +"%m-%d-%Y")
DATE_WITH_TIME=`date "+%H-%M"`

if [ $ROBOT_THREADS -eq 1 ]

then
    xvfb-run \
        --server-args="-screen 0 ${SCREEN_WIDTH}x${SCREEN_HEIGHT}x${SCREEN_COLOUR_DEPTH} -ac" \
        robot \
        --listener robotframework_reportportal.listener \
        --loglevel DEBUG \
        --variable RP_UUID:"xxxx-xxxx-xxxxx-xxxxxxxx" \
        --variable RP_ENDPOINT:"http://hostname.com" \
        --variable RP_LAUNCH:"API_Tests-$DATE_WITH_TIME" \
        --variable RP_PROJECT:"API Tests" \
        --outputDir /opt/robotframework/reports \
        ${ROBOT_OPTIONS} \
        /opt/robotframework/tests/TestSuites   
    
else
    xvfb-run \
        --server-args="-screen 0 ${SCREEN_WIDTH}x${SCREEN_HEIGHT}x${SCREEN_COLOUR_DEPTH} -ac" \
        pabot \
        --processes $ROBOT_THREADS \
        --listener robotframework_reportportal.listener \
        --variable RP_UUID:"xxxx-xxxx-xxxxx-xxxxxxxx" \
        --variable RP_ENDPOINT:"http://hostname.com" \
        --variable RP_LAUNCH:"API_Tests-$DATE_WITH_TIME" \
        --variable RP_PROJECT:"API Tests" \
        ${ROBOT_OPTIONS} \
        --outputDir /opt/robotframework/reports \
        /opt/robotframework/tests/TestSuites
    
fi


