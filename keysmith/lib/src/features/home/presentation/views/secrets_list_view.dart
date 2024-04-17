import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keysmith/src/features/home/presentation/states/cubits/secrets_list_cubit.dart';
import 'package:keysmith/src/features/home/presentation/states/cubits/secrets_list_state.dart';
import 'package:keysmith/src/features/home/presentation/states/models/tile_content_model.dart';
import 'package:keysmith/src/features/home/presentation/widgets/secrets_list_content_row.dart';

class SecretsListView extends StatelessWidget {
  const SecretsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecretsListCubit, SecretsListState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.secrets.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ExpansionTile(
              leading: const CircleAvatar(
                maxRadius: 25,
                child: Icon(Icons.key_rounded),
              ),
              title: Text(state.secrets[index].title),
              subtitle: state.secrets[index].subTitle != null
                  ? Text(state.secrets[index].subTitle!)
                  : null,
              trailing: const SizedBox(),
              childrenPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
              children: [
                //This switch expression is possible with a sealed class.
                //We are checking if the 'content' is a type of
                //'PasswordTileContentModel', then we assign
                //a variable to each property of that 'content' and return the
                //corresponding widget.
                switch (state.secrets[index].content) {
                  PasswordTileContentModel(
                    password: final password,
                    website: final website,
                  ) =>
                    _buildPasswordTileContent(
                      context,
                      password: password,
                      website: website,
                    ),
                  NoteTileContentModel(noteBody: final body) => Text(body),
                },
                const SizedBox(height: 20),
                SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    onPressed: () {
                      //TODO: navigate to password view
                    },
                    child: Text(
                      "Edit",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildPasswordTileContent(BuildContext context,
        {required String password, String? website}) =>
    Column(children: [
      SecretsListContentRow(
        icon: Icons.key,
        content: password,
      ),
      if (website != null)
        SecretsListContentRow(
          icon: Icons.satellite_alt_rounded,
          content: website,
        ),
    ]);
