# Maintain Learn MDX (learn.mdx)

Use this skill when the user asks to add, edit, or reorder talks, presentations, or other resources in `src/pages/resources/learn.mdx`.

## Rules

1. **New items always go to the top** of their section (most recent first).
2. **Order by year descending** — 2026, then 2025, then 2024, etc. Within the same year, most recent first.
3. **Check spelling and grammar** on every item added or edited:
   - Fix "Lighting" → "Lightning" when referring to the Lightning Network.
   - Fix German grammar articles (e.g., "der nächste der Layer" → "der nächste Layer").
   - Verify proper nouns, conference names, and URLs are correct.
4. **Preserve the existing format**: Markdown bullet lists with inline `[Video]`, `[PDF]`, `[Link]`, `[Article]`, `[Tutorial]` labels.
5. **Year sections**: Use `#### YYYY` subheadings under `## Talks` / `#### Presentations`. If only one year exists, no subheading is needed.
