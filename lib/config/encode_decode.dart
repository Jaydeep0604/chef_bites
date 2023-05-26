import 'dart:convert';

class EncodeDecode {
  Codec<String, String> stringToBase64 = utf8.fuse(base64);

  String encode(stringToBeEncoded) {
    String encode = stringToBase64.encode(stringToBeEncoded.toString());
    return encode;
  }

  String decode(encodedString) {
    String decode = stringToBase64.decode(stringToBase64.toString());
    return decode;
  }
}
