enum Environment { LOCAL, DEV, PROD }

class Constants {
  static Map<String, dynamic> config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.LOCAL:
        config = Config.localConstants;
        break;
      case Environment.DEV:
        config = Config.devConstants;
        break;
      case Environment.PROD:
        config = Config.prodConstants;
        break;
    }
  }



  static get BASE_API {
    return config[Config.BASE_API];
  }

  static get ENV {
    return config[Config.ENV];
  }
}

class Config {
  static const BASE_API = "BASE_API";
  static const ENV = "ENV";

  static Map<String, dynamic> localConstants = {
    BASE_API: "http://localhost:3000",
    ENV: "local",
  };

  static Map<String, dynamic> devConstants = {
    BASE_API: "https://dev-api.masspa.vn",
    ENV: "dev",
  };

  static Map<String, dynamic> prodConstants = {
    BASE_API: "https://api.masspa.vn",
    ENV: "prod"
  };
}

class Emotion {
  static const NORMAL = 'normal';
  static const ANGRY = 'angry';
  static const HAPPY = 'happy';
  static const SAD = 'sad';
  static const LOVE = 'love';
}