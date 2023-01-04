if [ -f ./env/.ota ]; 
then
    # Load Environment Variables
    echo "Load Environment"
    source ./scripts/init_env.sh  
    echo "Publish OTA version $APP_VERSION" \
    && appcenter codepush release-react -a ${APP_CENTER_ORGANIZATION}/${APP_CENTER_IDENTIFIER_IOS} -d ${APP_ENV_MODE} -t ${APP_VERSION} --token ${APP_CENTER_TOKEN}\
    && appcenter codepush release-react -a ${APP_CENTER_ORGANIZATION}/${APP_CENTER_IDENTIFIER_ANDROID} -d ${APP_ENV_MODE} -t ${APP_VERSION} --token ${APP_CENTER_TOKEN}

    echo "GET OTA IOS" && \
    OTA_IOS=$(appcenter codepush deployment history ${APP_ENV_MODE} --app ${APP_CENTER_ORGANIZATION}/${APP_CENTER_IDENTIFIER_IOS} --token ${APP_CENTER_TOKEN} --output json | tail -8 | head -n1 | grep -o -E '(v[0-9]*)') && \
    echo "$OTA_IOS" && \
    echo "GET OTA ANDROID" && \
    OTA_ANDROID=$(appcenter codepush deployment history ${APP_ENV_MODE} --app ${APP_CENTER_ORGANIZATION}/${APP_CENTER_IDENTIFIER_ANDROID} --token ${APP_CENTER_TOKEN} --output json | tail -8 | head -n1 | grep -o -E '(v[0-9]*)')  && \
    echo "$OTA_ANDROID"
    #  && \
    # echo "Send chat report" && \
    # curl --location --request POST 'https://chat.googleapis.com/v1/spaces/AAAAhHtCpLk/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=fPGdv57YFuWWIGpsm0ZEBr_0umP3XrKVtIzcRf-4Q4s%3D' \
    # --header 'Content-Type: application/json' \
    # --data-raw '{
    # "text": "Starbucks VN OTA Update Successfully on version '$APP_VERSION' iOS '$OTA_IOS' / Android '$OTA_ANDROID'"
    # }'
else
    echo "Environment file not found"   
fi
