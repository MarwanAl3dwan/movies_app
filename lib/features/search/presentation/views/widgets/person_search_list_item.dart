import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/size_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../domain/entities/person_entity.dart';

class PersonSearchListItem extends StatefulWidget {
  const PersonSearchListItem({super.key, required this.personEntity});

  final PersonEntity personEntity;

  @override
  State<PersonSearchListItem> createState() => _PersonSearchListItemState();
}

class _PersonSearchListItemState extends State<PersonSearchListItem> {
  StringBuffer string = StringBuffer('');

  @override
  void initState() {
    fillKnownForSection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: SizeManager.s85,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.network(
              '${AssetsManager.imageUrl}${widget.personEntity.personProfilePath}',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        const SizedBox(width: SizeManager.s16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.personEntity.personName,
                  style: StylesManager.textStyle22),
              // const SizedBox(height: SizeManager.s6),
              Wrap(
                children: [
                  Text(
                    string.toString(),
                    style: StylesManager.textStyle18.copyWith(
                      height: 1,
                      fontWeight: FontWeight.normal,
                      color: ColorsManager.loadingColor,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void fillKnownForSection() {
    string.write(widget.personEntity.personKnownForDepartment);
    string.write(' \u2022 ');
    for (var i = 0; i < widget.personEntity.personKnownFor.length; i++) {
      if (i == widget.personEntity.personKnownFor.length - 1) {
        string.write('${widget.personEntity.personKnownFor[i].movieTitle}.');
      } else {
        string.write('${widget.personEntity.personKnownFor[i].movieTitle}, ');
      }
    }
  }
}
