enum UIError { requiredField, invalidField, unexpectedError }

extension UIErrorExtension on UIError {
  String get description {
    switch (this) {
      case UIError.requiredField:
        return "Campo obrigatório";
      case UIError.invalidField:
        return "Campo inválido";
      default:
        return "Opa, algo de errado não está certo";
    }
  }
}
