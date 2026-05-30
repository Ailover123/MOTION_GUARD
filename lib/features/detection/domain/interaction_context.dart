class InteractionContext {
  const InteractionContext({
    required this.screenUnlocked,
    required this.userRecentlyInteracted,
    required this.permissionDegraded,
  });

  final bool screenUnlocked;
  final bool userRecentlyInteracted;
  final bool permissionDegraded;
}
