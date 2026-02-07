---
globs: web/src/**/*.{tsx,ts}
---

# React NUI Components

## Structure Order
1. Imports (external → internal → relative)
2. Type/interface definitions
3. Component function
4. Exports

## NUI Communication
- Use `fetchNui(event, data)` for React → Lua communication
- Use `useNuiEvent(action, handler)` for Lua → React communication
- Always return a response from NUI callbacks, even if empty `{}`

## Component Guidelines
- Function components with hooks — no class components
- Props interface defined directly above the component
- Components under 200 lines — split when larger
- Use Zustand for cross-component state
- Use `fetchNui` for all server communication

## Accessibility
- Use semantic HTML elements
- Ensure keyboard navigability (ESC to close MDT)
- All interactive elements need focus states

## State
- Local state for UI-only concerns (open/closed, hover)
- Zustand for global state (active tab, user session, search results)
