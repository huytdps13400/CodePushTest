import Config from 'react-native-config';

export enum ENVName {
  Dev = 'Dev',
  Staging = 'Staging',
  Prod = 'Prod',
}
export interface ENVFields {
  API_URL: string;
  APP_ENV: string;
  CODE_PUSH_KEY_ANDROID: string;
  CODE_PUSH_KEY_IOS: string;
}

export interface ENVFields {
  API_URL: string;
  APP_ENV: string;
  CODE_PUSH_KEY_ANDROID: string;
  CODE_PUSH_KEY_IOS: string;
}

export const initEnv = Config.APP_ENV as ENVName;

const EnvConfig = {
  Dev: {
    APP_ENV: 'Dev',
    API_URL: 'https://jsonplaceholder.typicode.com/',
    CODE_PUSH_KEY_ANDROID: '1mRT25xy_xscY8CfW4D8Q5g6RUQeFa_kao-z9',
    CODE_PUSH_KEY_IOS: 'dp5i5dtb-pZ9iAlXEkKl0uB7j05ggNkNRfnBX',
  },
  Staging: {
    APP_ENV: 'Staging',
    API_URL: 'https://jsonplaceholder.typicode.com/',
    CODE_PUSH_KEY_ANDROID: '1mRT25xy_xscY8CfW4D8Q5g6RUQeFa_kao-z9',
    CODE_PUSH_KEY_IOS: 'dp5i5dtb-pZ9iAlXEkKl0uB7j05ggNkNRfnBX',
  },
  Prod: {
    APP_ENV: 'Prod',
    API_URL: 'https://jsonplaceholder.typicode.com/',
    CODE_PUSH_KEY_ANDROID: 'ZmJfFuAsJ8K3LV3SSBqAgXDHIX5tGFz16jyFG',
    CODE_PUSH_KEY_IOS: 'EDD_xa_gkhRfHch3oxc0ARR79o2VjlD6cmfDl',
  },
};

export const ENVDynamic = (env: ENVName) => {
  return EnvConfig[env];
};

export default EnvConfig[initEnv];
