import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:app_costura/app/modules/clients/ui/stores/clients_store.dart';
import 'package:app_costura/app/modules/clients/ui/widgets/form_input.dart';
import 'package:app_costura/app/modules/clients/ui/widgets/modal_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientAddPage extends StatefulWidget {
  const ClientAddPage({Key? key}) : super(key: key);

  @override
  State<ClientAddPage> createState() => _ClientAddPageState();
}

class _ClientAddPageState extends State<ClientAddPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final colors = Theme.of(context).colorScheme;
    Client client = Client(id: 10123, name: "");
    final store = Modular.get<ClientStore>();

    return Scaffold(
      backgroundColor: colors.primary,
      body: ModalPage(
        title: "Adicionar contato",
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
                await store.add(client);
                Modular.to.pop();
              }
            }
          },
        ),
        assetImage: const AssetImage('assets/images/ruler.png'),
        imagePositionLeft: width / 2.2,
        children: [
          Form(
            key: _formKey,
            child: Column(children: [
              FormInputField(
                label: 'Nome do cliente',
                type: TextInputType.text,
                onSaved: (value) => client.name = value,
                shouldValidate: true,
              ),
              FormInputField(
                label: 'Telefone',
                type: TextInputType.phone,
                onSaved: (value) => client.phone = value.toString(),
                shouldValidate: true,
              ),
              Row(children: [
                Expanded(
                  child: FormInputField(
                    label: 'Busto',
                    onSaved: (value) => client.bust = parseStringToInt(value),
                  ),
                ),
                Expanded(
                  child: FormInputField(
                    label: 'Altura do Busto',
                    onSaved: (value) => client.bustHeight = parseStringToInt(value),
                  ),
                ),
              ]),
              Row(children: [
                Expanded(
                  child: FormInputField(
                    label: 'Quadril',
                    onSaved: (value) => client.hip = parseStringToInt(value),
                  ),
                ),
                Expanded(
                  child: FormInputField(
                    label: 'Largura do braço',
                    onSaved: (value) => client.bustHeight = parseStringToInt(value),
                  ),
                ),
              ]),
              Row(children: [
                Expanded(
                  child: FormInputField(
                    label: 'Costas',
                    onSaved: (value) => client.shoulderWidth = parseStringToInt(value),
                  ),
                ),
                Expanded(
                  child: FormInputField(
                    label: 'Cintura',
                    onSaved: (value) => client.waist = parseStringToInt(value),
                  ),
                ),
              ]),
              FormInputField(
                label: 'Comprimento da manga',
                onSaved: (value) => client.sleeveLenght = parseStringToInt(value),
              ),
              FormInputField(
                label: 'Comprimento do corpo',
                onSaved: (value) => client.torso = parseStringToInt(value),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

int parseStringToInt(String string) => string == "" ? 0 : int.parse(string);