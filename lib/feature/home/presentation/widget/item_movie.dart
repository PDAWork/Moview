import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/feature/home/domain/entity/item_entity.dart';
import 'package:movie/routes/app_router_utils.dart';

class ItemMovie extends StatelessWidget {
  const ItemMovie({super.key, required ItemEntity item}) : _item = item;

  final ItemEntity _item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.goNamed(Pages.movie.screenName, pathParameters: {
        "id": _item.id.toString(),
        "name": _item.name,
      }),
      leading: _item.urlImage == null
          ? const Icon(Icons.error_outline)
          : Image.network(
              _item.urlImage!,
            ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.yellow.shade700),
          const SizedBox(
            width: 5,
          ),
          Text(_item.ratingKP.toStringAsFixed(1)),
        ],
      ),
      title: Text(
        _item.name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        _item.shortDescription,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
