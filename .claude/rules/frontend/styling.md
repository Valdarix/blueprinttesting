---
globs: "web/src/**/*.{tsx,ts,css}"
---

# Styling

## Approach: Tailwind CSS
- Utility-first: compose classes in markup
- Use shadcn/ui components for common UI patterns
- No inline styles or separate CSS module files

## Design Theme
- Dark theme base: zinc-900 background, zinc-950 sidebar
- White text on dark backgrounds
- Blue accent for primary actions (matching department colors)
- Clean, modern, professional — like a real police terminal

## Responsive Design
- MDT renders at 85vw x 85vh centered
- Internal layout uses flex/grid for responsive sections
- Sidebar collapses are not needed (MDT is always fullscreen)

## CSS Variables
- Design tokens defined via Tailwind config
- Department colors configurable via config
