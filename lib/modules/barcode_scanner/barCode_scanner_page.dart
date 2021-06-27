import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:pay_flow/shared/widgets/set_buttons/set_label_buttons.dart';

import 'barcode_scanner_controller.dart';
import 'barcode_scanner_status.dart';

class BarCodeScannerPage extends StatefulWidget {
  const BarCodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarCodeScannerPageState createState() => _BarCodeScannerPageState();
}

class _BarCodeScannerPageState extends State<BarCodeScannerPage> {
  final controller = BarCodeScannerController();

  @override
  void initState() {
    super.initState();
    controller.getAvailableCamera();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarCode) {
        Navigator.pushNamed(context, '/insertBoleto',
            arguments: controller.status.barcode);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Stack(
          children: [
            ValueListenableBuilder<BarCodeScannerStatus>(
                valueListenable: controller.statusNotifier,
                builder: (_, status, __) {
                  if (status.showCamera) {
                    return Container(
                      child: controller.cameraController!.buildPreview(),
                    );
                  } else {
                    return Container();
                  }
                }),
            RotatedBox(
              quarterTurns: 1,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  centerTitle: true,
                  title: Text(
                    "Escaneie o código de barras do boleto",
                    style: TextStyles.buttonBackground,
                  ),
                  leading: BackButton(
                    color: AppColors.background,
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: SetLabelButtons(
                  primaryLabel: 'Inserir código do boleto',
                  primaryOntap: () {
                    Navigator.pushNamed(context, '/insertBoleto');
                  },
                  secondaryLabel: 'Adicione da galeria',
                  secondaryOntap: () {},
                ),
              ),
            ),
            ValueListenableBuilder<BarCodeScannerStatus>(
                valueListenable: controller.statusNotifier,
                builder: (_, status, __) {
                  if (status.hasError) {
                    return BottomSheetWidget(
                        title:
                            'Não foi possível identificar um código de barras.',
                        subTitle:
                            ' Tente escanear novamente ou digite o código do seu boleto.',
                        primaryLabel: 'Escanear novamente',
                        primaryOntap: () {
                          controller.scanWithCamera();
                        },
                        secondaryLabel: 'Digitar código',
                        secondaryOntap: () {});
                  } else {
                    return Container();
                  }
                }),
          ],
        ));
  }
}
