class BarCodeScannerStatus {
  final bool isCameraAvailable;
  final String error;
  final String barcode;
  final bool stopScanner;

  BarCodeScannerStatus({
    this.stopScanner = false,
    this.isCameraAvailable = false,
    this.error = '',
    this.barcode = '',
  });

  //!Construtores específicos
  factory BarCodeScannerStatus.available() =>
      BarCodeScannerStatus(isCameraAvailable: true, stopScanner: false);

  factory BarCodeScannerStatus.error(String error) =>
      BarCodeScannerStatus(error: error, stopScanner: true);

  factory BarCodeScannerStatus.barcode(String barcode) =>
      BarCodeScannerStatus(barcode: barcode, stopScanner: true);

  bool get showCamera => isCameraAvailable && error.isEmpty;
  bool get hasError => error.isNotEmpty;
  bool get hasBarCode => barcode.isNotEmpty;
}
