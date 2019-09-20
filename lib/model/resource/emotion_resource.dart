class EmotionResource {
    String branchCode;
    String emotion;

    EmotionResource({this.branchCode, this.emotion});

    factory EmotionResource.fromJson(Map<String, dynamic> json) {
        return EmotionResource(
            branchCode: json['branchCode'], 
            emotion: json['emotion'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['branchCode'] = this.branchCode;
        data['emotion'] = this.emotion;
        return data;
    }
}