import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/home/data/site_repository.dart';

class SyncButton extends ConsumerStatefulWidget {
  const SyncButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SyncButton();
}

class _SyncButton extends ConsumerState<SyncButton> {
  bool _isLoading = false;
  bool _isSuccess = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (_isLoading)
          const CircularProgressIndicator(
            strokeWidth: 3.0,
          ),
        if (_isSuccess)
          Positioned(
            bottom: 4,
            right: 3,
            child: Icon(
              size: 16,
              Icons.check_circle,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        IconButton(
          icon: const Icon(Icons.cloud_sync_outlined),
          onPressed: () async {
              setState(() {
                _isLoading = true;
              });
              try {
                bool result = await ref.read(syncSiteProvider.future);
                setState(() {
                  _isLoading = false;
                });
                if (result) {
                  setState(() {
                    _isSuccess = true;
                  });
                  await Future.delayed(const Duration(seconds: 1));
                  setState(() {
                    _isSuccess = false;
                    ref.refresh(finaAllByTextProvider(text: ''));
                  });
                }
              } finally {
                if(_isLoading){
                  setState(() {
                    _isLoading = false;
                  });
                }
              }
            },
        ),
      ],
    );
  }
}