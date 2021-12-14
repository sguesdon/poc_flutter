if(window.location.hash) {
  const params = {};
  const requiredParams = ['access_token', 'code', 'id_token'];
  const rawParams = (window.location.hash.substr(1)).split("&");
  for(rawParam of rawParams) {
    const [key, value] = rawParam.split('=');
    params[key] = value;
  }
  if(requiredParams.some((k) => typeof params[k] != 'undefined')) {
    window.localStorage['openid_client:auth'] = JSON.stringify(params);
  }
}