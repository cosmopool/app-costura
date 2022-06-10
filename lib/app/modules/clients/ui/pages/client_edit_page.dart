import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/ui/stores/clients_store.dart';
import 'package:app_costura/app/modules/clients/ui/widgets/form_input.dart';
import 'package:app_costura/app/modules/clients/ui/widgets/modal_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientEditPage extends StatefulWidget {
  final Client client;
  const ClientEditPage({Key? key, required this.client}) : super(key: key);

  @override
  State<ClientEditPage> createState() => _ClientEditPageState();
}

class _ClientEditPageState extends State<ClientEditPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final colors = Theme.of(context).colorScheme;
    final store = Modular.get<ClientStore>();

    return Scaffold(
      backgroundColor: colors.primary,
      body: SafeArea(
        child: ModalPage(
          title: "Editar contato",
          backgroundColor: colors.secondaryContainer,
          iconsColor: colors.outline,
          trailingIcon: IconButton(
            color: colors.outline,
            icon: const Icon(Icons.done),
            onPressed: () async {
              final currentState = _formKey.currentState;
              if (currentState != null) {
                final isValid = currentState.validate();
                if (isValid) {
                  currentState.save();
                  await store.edit(widget.client);
                  Modular.to.pop();
                }
              }
            },
          ),
          assetImage: const AssetImage('assets/images/ruler.png'),
          imageWidth: height * 0.6,
          imagePositionLeft: width / 1.8,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.01,
                      horizontal: width * 0.05,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(children: [
                        FormInputField(
                          label: 'Nome do cliente',
                          type: TextInputType.text,
                          initialValue: widget.client.name,
                          onSaved: (value) => widget.client.name = value,
                          shouldValidate: true,
                        ),
                        FormInputField(
                          label: 'Telefone',
                          type: TextInputType.phone,
                          initialValue: widget.client.phone,
                          onSaved: (value) => widget.client.phone = value.toString(),
                          shouldValidate: true,
                        ),
                        Row(children: [
                          Expanded(
                            child: FormInputField(
                              label: 'Busto',
                              initialValue: widget.client.bust.toString(),
                              onSaved: (value) =>
                                  widget.client.bust = parseStringToInt(value),
                            ),
                          ),
                          Expanded(
                            child: FormInputField(
                              label: 'Altura do Busto',
                              initialValue: widget.client.bustHeight.toString(),
                              onSaved: (value) =>
                                  widget.client.bustHeight = parseStringToInt(value),
                            ),
                          ),
                        ]),
                        Row(children: [
                          Expanded(
                            child: FormInputField(
                              label: 'Quadril',
                              initialValue: widget.client.waist.toString(),
                              onSaved: (value) =>
                                  widget.client.hip = parseStringToInt(value),
                            ),
                          ),
                          Expanded(
                            child: FormInputField(
                              label: 'Largura do braço',
                              initialValue: widget.client.biceps.toString(),
                              onSaved: (value) =>
                                  widget.client.biceps = parseStringToInt(value),
                            ),
                          ),
                        ]),
                        Row(children: [
                          Expanded(
                            child: FormInputField(
                              label: 'Costas',
                              initialValue: widget.client.shoulderWidth.toString(),
                              onSaved: (value) => widget.client.shoulderWidth =
                                  parseStringToInt(value),
                            ),
                          ),
                          Expanded(
                            child: FormInputField(
                              label: 'Cintura',
                              initialValue: widget.client.waist.toString(),
                              onSaved: (value) =>
                                  widget.client.waist = parseStringToInt(value),
                            ),
                          ),
                        ]),
                        FormInputField(
                          label: 'Comprimento da manga',
                          initialValue: widget.client.sleeveLenght.toString(),
                          onSaved: (value) =>
                              widget.client.sleeveLenght = parseStringToInt(value),
                        ),
                        FormInputField(
                          label: 'Comprimento do corpo',
                          initialValue: widget.client.torso.toString(),
                          onSaved: (value) =>
                              widget.client.torso = parseStringToInt(value),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int parseStringToInt(String string) => string == "" ? 0 : int.parse(string);
