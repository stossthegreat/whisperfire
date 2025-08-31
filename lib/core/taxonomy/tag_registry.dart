class Tag {
  final String id;            // stable
  final String label;         // display
  final List<String> aliases; // old names accepted

  const Tag({required this.id, required this.label, this.aliases = const []});
}

class TagRegistry {
  TagRegistry(this.tags) {
    for (final t in tags) {
      _byId[t.id.toLowerCase()] = t;
      _byName[t.label.toLowerCase()] = t.id;
      for (final a in t.aliases) {
        _byName[a.toLowerCase()] = t.id;
      }
    }
  }
  final List<Tag> tags;
  final _byId = <String, Tag>{};
  final _byName = <String, String>{};

  String? resolveToId(String any) {
    final k = any.toLowerCase().trim();
    if (_byId.containsKey(k)) return k;   // it's an ID
    return _byName[k];                     // label/alias → ID
  }
  Tag? getById(String id) => _byId[id.toLowerCase()];
}

final registry = TagRegistry([
  Tag(
    id: 'strategic_influence',
    label: 'Psychological Gravity',
    aliases: ['Strategic Influence', 'Seduction', 'Deception'],
  ),
  Tag(
    id: 'composed_authority',
    label: 'Emotional Alchemy',
    aliases: ['Composed Authority'],
  ),
  // Keep other existing tags unchanged
  Tag(
    id: 'magnetic_presence',
    label: 'Magnetic Presence',
    aliases: ['Magnetic Presence'],
  ),
  Tag(
    id: 'conversation_frames',
    label: 'Conversation Frames',
    aliases: ['Conversation Frames'],
  ),
  Tag(
    id: 'scarcity_desire',
    label: 'Scarcity & Desire',
    aliases: ['Scarcity & Desire'],
  ),
  Tag(
    id: 'hidden_dynamics',
    label: 'Hidden Dynamics',
    aliases: ['Hidden Dynamics'],
  ),
]);

String displayTag(String id) => registry.getById(id)?.label ?? id; 