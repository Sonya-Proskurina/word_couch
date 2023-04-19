import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/ui/loading_widget.dart';
import 'package:word_couch/features/word_information/presentation/widgets/word_information_sections_list.dart';
import '../../../../core/di.dart';
import '../manager/manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WordInformationPage extends ConsumerStatefulWidget {
  WordInformationPage({Key? key}) : super(key: key);

  final manager = DI.wordInfoManager;
  final managerUser = DI.profileManager;
  final notifier = DI.wordInfoNotifier;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      WordInformationPageState();
}

class WordInformationPageState extends ConsumerState<WordInformationPage> {
  late WordInfoManager manager;

  @override
  void initState() {
    super.initState();
    manager = ref.read(widget.manager);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      bool? isFavorite = ModalRoute.of(context)?.settings.arguments as bool?;
      manager.init(isFavorite);
      manager.notifier.setLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    final wordInfoState = ref.watch(widget.notifier);
    return wordInfoState.when(success: (value, isFavorite) {
      if (value.wordInfo?.word != null) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ref.read(DI.profileManager).addHistory(value.wordInfo!.word,
              value.wordInfo?.results[0].definition ?? "");
        });
      }
      return Material(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar.large(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                Visibility(
                  visible: isFavorite != null,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: TextButton.icon(
                        onPressed: () {
                          manager.changeFavorite();
                          ref.read(widget.managerUser).addFavorite(
                              manager.argNotifier.getState(),
                              !(isFavorite ?? false));
                        },
                        icon: Icon(isFavorite ?? false
                            ? Icons.bookmark
                            : Icons.bookmark_outline),
                        label: Text(AppLocalizations.of(context)!.bookmark)),
                  ),
                )
              ],
              title: Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Text(manager.argNotifier.getState(),
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    value.wordInfo?.results.first.partOfSpeech ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.apply(color: Colors.black54),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  if (value.image?.value?.isNotEmpty == true &&
                      value.image?.value?.first.thumbnailUrl != null)
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                            value.image?.value?.first.thumbnailUrl ?? "",
                            fit: BoxFit.cover),
                      ),
                    ),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            value.wordInfo?.results[0].definition ??
                                manager.argNotifier.getState(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        WordInformationSectionsList(
                            wordInfo: value.wordInfo?.results.first)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }, error: (error) {
      return Material(
        child: CustomScrollView(slivers: [
          SliverAppBar.large(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Row(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(manager.argNotifier.getState(),
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  width: 4,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Text(AppLocalizations.of(context)!.errorLoad),
            ),
          ),
        ]),
      );
    }, loading: () {
      return const LoadingWidget();
    });
  }
}
