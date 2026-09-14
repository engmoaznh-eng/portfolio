# Current Status

Last updated: 2026-09-14

## Completed

- Repository/CV inspected, findings documented in `PROJECT_ANALYSIS.md`.
- Architecture, sections, data model, and responsive strategy specified in `PROJECT_SPECIFICATION.md`.
- Flutter Web project scaffolded at `C:\mywork\portfolio` (Flutter 3.27.4 / Dart 3.6.2 stable).
- Centralized theme (dark, blue→purple gradient accents), responsive breakpoints, and constants.
- Data-driven architecture: `lib/models/` + `lib/data/` hold every fact; sections/widgets are dumb and reusable.
- All content sourced from the CV, nothing invented — see `PROJECT_ANALYSIS.md` for the full source mapping.
- Sections built: Home/Hero, About, Skills, Projects (grid + full details view + screenshot lightbox),
  Experience (timeline, incl. Courses & Certifications), Education, Contact (mailto-based form + info card),
  Footer.
- Sticky responsive nav bar with smooth scroll-to-section, mobile bottom-sheet menu.
- CV asset bundled at `assets/cv/cv.pdf` (the real file provided by the user) and wired to "Download CV".
- All 10 real projects from the CV added to `lib/data/projects_data.dart` with accurate descriptions and tech
  tags (nothing beyond what the CV states).
- 10 project image folders created under `assets/images/projects/` with `.gitkeep`; missing images render a
  clean "Image coming soon" placeholder instead of a broken image.
- `web/index.html` + `web/manifest.json` updated with real title, description, Open Graph tags, and language.
- `.github/workflows/deploy.yml` created: builds with `--base-href /portfolio/` and deploys to GitHub Pages via
  `actions/deploy-pages` on every push to `main`.
- `flutter analyze` → **no issues found**.
- `flutter build web --release --base-href /portfolio/` → **build succeeded**; verified `build/web/index.html`
  contains `<base href="/portfolio/">`, and that the CV + all 10 project asset folders are present under
  `build/web/assets/assets/...`.
- Manually verified in-browser (desktop 1280px and mobile 375px): hero, nav smooth-scroll, projects grid,
  project details view (cover image → description → tech badges → screenshot gallery), experience timeline, and
  mobile stacked layout all render correctly. Fixed one real bug found during this pass: the project details
  route was non-opaque and rendered on top of the projects grid instead of replacing it
  (`lib/sections/projects/project_details_view.dart`) — now fixed and re-verified.
- `README.md` written with local run, build, deploy, and "how to add a project/image/CV" instructions.

## Remaining — things only you can provide

- **Project screenshots**: drop real `cover.png` / `screenshot-*.png` files into
  `assets/images/projects/<id>/` for: `massar`, `warraq`, `quran`, `sign_language`, `maze_game`, `bmi`,
  `mrb_coin`, `shisha`, `playstation_cafe`, `tammini`. Recommended size ~1600×1000px, see README.
- **GitHub URL / LinkedIn URL**: not present on the CV, so currently hidden site-wide. Add them to
  `lib/data/personal_data.dart` (`githubUrl`, `linkedinUrl`) once you have them.
- **GitHub repository**: does not exist yet. It needs to be created (empty) under `engmoaznh-eng` before this
  code can be pushed and before GitHub Pages can be enabled.
- **"Historic Syria" project**: mentioned in the original brief but absent from the CV — intentionally left out
  rather than invented. Add it the same way as any other project (see README "Adding a New Project") once you
  have real details/images for it.
- **Live demo links**: none of the 10 projects have a public live URL on the CV — `liveUrl` is `null` for all of
  them, so no "Live Demo" button is shown. Add a URL per-project in `projects_data.dart` if any go live.
- **App icons/favicon**: still the default Flutter-generated icons (`web/icons/`, `web/favicon.png`). Replace
  with a personal logo/initials mark if desired — not required for the site to function correctly.

## How to Run

```bash
cd portfolio
flutter pub get
flutter run -d chrome
```

## How to Deploy

1. Create an empty GitHub repository named `portfolio` under the `engmoaznh-eng` account.
2. From `C:\mywork\portfolio`: `git init` (if not already), commit, add the remote, and push to `main`.
3. In the GitHub repo, go to **Settings → Pages** and set **Source** to **"GitHub Actions"** (one-time manual
   step GitHub requires — it cannot be set via a commit).
4. Push to `main` (or re-run manually via the Actions tab) — the `deploy.yml` workflow builds and publishes
   automatically.
5. Site goes live at `https://engmoaznh-eng.github.io/portfolio/`.

## How to Add Project Images

See README.md § "Adding / Replacing Project Images" — folders already exist and are wired up; just add files
with the exact expected names (`cover.png`, `screenshot-1.png`, ...) and rebuild.
