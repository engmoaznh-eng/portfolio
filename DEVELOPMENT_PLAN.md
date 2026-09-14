# Development Plan

Execution order (matches the task brief's workflow):

1. ~~Inspect repository~~ — done, no prior repo existed.
2. ~~Read/analyze CV~~ — done, see `PROJECT_ANALYSIS.md`.
3. ~~Plan architecture~~ — done, see `PROJECT_SPECIFICATION.md`.
4. ~~Create documentation~~ — this file + the two above, `CURRENT_STATUS.md` created and updated throughout.
5. ~~Create Flutter Web project~~ — `flutter create --platforms=web` at `C:\mywork\portfolio`.
6. Build theme (`core/theme`, `core/constants`, `core/responsive`).
7. Build responsive navigation (`widgets/navigation`).
8. Build Hero (`sections/home`).
9. Build About (`sections/about`).
10. Build Skills (`sections/skills`).
11. Build Projects grid + cards (`sections/projects`, `widgets/project`).
12. Build Project Details view + screenshot gallery.
13. Build Experience (`sections/experience`).
14. Build Education (`sections/education`).
15. Build Contact (`sections/contact`).
16. Add CV asset (`assets/cv/cv.pdf` — already copied from the user-supplied PDF) + wire up download button.
17. Add project image placeholder assets (10 folders, generated placeholder `cover.png` each).
18. Configure responsive behavior end-to-end (verify at mobile/tablet/desktop/wide in-browser).
19. Configure GitHub Pages base href handling.
20. Configure GitHub Actions workflow (`.github/workflows/deploy.yml`).
21. Run `flutter analyze`, fix all warnings/errors introduced.
22. Run `flutter build web --release --base-href /portfolio/`, verify `build/web/` output.
23. Fix any issues found.
24. Write `README.md`.
25. Finalize `CURRENT_STATUS.md` (completed vs. remaining-for-user).
26. Final review pass (manual browser check of all sections/links/responsive tiers).

Tracked live via the session task list; `CURRENT_STATUS.md` is the durable, human-readable record of where things
stand at any point.
