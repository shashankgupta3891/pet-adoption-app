import 'package:flutter/material.dart';

class PaginatedListView<T> extends StatefulWidget {
  /// [T] defines the type of data of the list
  const PaginatedListView({
    Key? key,
    required this.onFetch,
    required this.itemBuilder,
    this.onLoadStart,
    this.onLoadEnd,
    this.initialData = const [],
    this.shrinkWrap = true,
    this.separator,
    this.padding,
    this.physics,
  }) : super(key: key);

  /// Run the request with the current page as a parameter
  final Future<List<T>> Function(int) onFetch;

  final Function(T) itemBuilder;

  /// Optional, Initial list of data to be shown, default is []
  final List<T> initialData;

  /// Optional, should shirdWrap the list?
  final bool shrinkWrap;

  /// Optional, the [Widget] to be built as separator
  final Widget? separator;

  /// Optional, so you can handle when fetching start
  final void Function()? onLoadStart;

  /// Optional, so you can handle when fetching end
  final void Function()? onLoadEnd;

  /// Optional, set padding of the listview
  final EdgeInsetsGeometry? padding;

  /// Optional, set scroll physics of the listview
  final ScrollPhysics? physics;

  @override
  State<PaginatedListView<T>> createState() => _PaginatedListViewState<T>();
}

class _PaginatedListViewState<T> extends State<PaginatedListView<T>> {
  final _scrollController = ScrollController();

  int _page = 1;
  bool _noMore = false;
  List<T> items = <T>[];

  void _addItems(List<T> newItems) {
    if (newItems.isEmpty) return;
    setState(() {
      items.addAll(newItems);
    });
  }

  void _onFetch() async {
    if (!_noMore) {
      widget.onLoadStart?.call();
      final newItems = await widget.onFetch(_page + 1);
      widget.onLoadEnd?.call();
      setState(() {
        _noMore = newItems.isEmpty;
        _page++;
      });
      _addItems(newItems);
    }
  }

  @override
  void initState() {
    _addItems(widget.initialData);

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        _onFetch();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      itemCount: items.length,
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
      physics: widget.physics,
      itemBuilder: (context, index) {
        final item = items[index];
        return widget.itemBuilder.call(item);
      },
      separatorBuilder: (context, index) {
        return widget.separator ?? const SizedBox.shrink();
      },
    );
  }
}
