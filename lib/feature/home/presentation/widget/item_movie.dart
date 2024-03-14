import 'package:flutter/material.dart';
import 'package:movie/feature/home/domain/entity/item_entity.dart';

class ItemMovie extends StatelessWidget {
  const ItemMovie({super.key, required ItemEntity item}) : _item = item;

  final ItemEntity _item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _item.urlImage == null
          ? const Icon(Icons.error_outline)
          : Image.network(
              _item.urlImage!,
            ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Expanded(
            child: Icon(
              Icons.favorite_border,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.yellow.shade700),
                const SizedBox(
                  width: 5,
                ),
                Text("${_item.ratingKP}"),
              ],
            ),
          ),
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
