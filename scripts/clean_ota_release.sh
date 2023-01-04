if [ -f ./env/.ota ]; 
then
    # Load Environment Variables
    echo "Load Environment"
    source ./scripts/init_env.sh  
    echo "Clean OTA release version $APP_VERSION" \
    && appcenter codepush deployment clear -a ${APP_CENTER_ORGANIZATION}/${APP_CENTER_IDENTIFIER_IOS} ${APP_ENV_MODE} --token ${APP_CENTER_TOKEN} \
    && appcenter codepush deployment clear -a ${APP_CENTER_ORGANIZATION}/${APP_CENTER_IDENTIFIER_ANDROID} ${APP_ENV_MODE} --token ${APP_CENTER_TOKEN}
else
    echo "Environment file not found"   
fi
