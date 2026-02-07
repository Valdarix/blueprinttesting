# Roadmap — Foundation MDT

## Vision

Foundation MDT aims to be the most extensible and well-designed police MDT for QBCore FiveM servers, with a plugin architecture that adapts to any server's resource stack.

---

## Phase 1: Foundation (MVP)

**Goal:** Core MDT structure, database, NUI shell, and 3-4 key modules functional end-to-end.

**Key Deliverables:**

- [ ] Project scaffold — fxmanifest, folder structure, config system (S)
- [ ] Database schema — all tables for MVP modules (M)
- [ ] NUI shell — React app with layout, sidebar navigation, routing (M)
- [ ] Bridge system — loader, auto-detection, dispatch + notify bridges (M)
- [ ] Citizen Profiles module — search, view, criminal history (L)
- [ ] Vehicle Lookup module — plate search, registration info, flags (M)
- [ ] Warrant Management module — create, view, serve, manage warrants (L)
- [ ] BOLO module — create, view, manage BOLOs for persons/vehicles (M)
- [ ] Unit Management module — active units, status, assignments (M)
- [ ] Permission system — QBCore job/grade integration, rank-based access (M)
- [ ] Config system — main config + department config + permissions config (S)
- [ ] MDT open/close — keybind, NUI focus, job check (S)

---

## Phase 2: Enhancement

**Goal:** Remaining modules, evidence system, and polish.

**Key Deliverables:**

- [ ] Incident Reports module — create, file, attach charges, link citizens (L)
- [ ] Penal Code module — searchable charges database, configurable fines/jail (M)
- [ ] Dispatch/911 module — view active calls, assign units (M)
- [ ] Evidence/Mugshots module — photo upload via Discord/FiveManage (M)
- [ ] Department Roster module — officer list, ranks, certifications (M)
- [ ] Prison bridge — QB Prison + XT Prison integration (M)
- [ ] Phone bridge — QB Phone + LB Phone integration (M)
- [ ] UI polish — animations, loading states, error handling, responsive design (M)
- [ ] Configuration — penal codes config, image provider config (S)

---

## Phase 3: Scale

**Goal:** Production readiness, commercial polish, and documentation for buyers.

**Key Deliverables:**

- [ ] Buyer documentation — installation guide, configuration reference, FAQ (M)
- [ ] CFX Escrow setup — escrow_ignore list, asset protection (S)
- [ ] Tebex listing — storefront setup, screenshots, description (S)
- [ ] Performance optimization — query optimization, NUI bundle size (M)
- [ ] Security audit — SQL injection prevention, permission bypass checks (M)
- [ ] Multi-language support — i18n framework for NUI + Lua notifications (L)
- [ ] Activity logging — audit trail for MDT actions (M)
- [ ] Dashboard — officer stats, department overview, recent activity (M)

---

## Future Considerations

- EMS/Fire department support (separate MDT views per department type)
- Custom report templates (configurable report forms)
- API endpoints for external CAD integration (Sonoran CAD, etc.)
- Mobile-friendly responsive NUI for tablet/phone RP
- Advanced search with filters and sorting
- Dark/light theme toggle
- Webhook notifications for high-priority BOLOs/warrants
- Integration with more dispatch systems (cd_dispatch v2, etc.)
- Map integration for unit/call locations
- Automated backup/export of MDT data
