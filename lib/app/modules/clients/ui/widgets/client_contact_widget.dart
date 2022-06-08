import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:flutter/material.dart';

class ClientContactWidget extends StatelessWidget {
  final Client client;
  final Function onTap;

  const ClientContactWidget({
    Key? key,
    required this.client,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => onTap(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width * (0.7),
            child: Text(
              client.name,
              style: textTheme.headlineMedium?.copyWith(
                color: colors.secondaryContainer,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Icon(
            Icons.navigate_next,
            color: colors.secondaryContainer,
          ),
        ],
      ),
    );
  }
}
