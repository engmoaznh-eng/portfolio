# Portfolio

Professional Flutter Web portfolio for **Moaz Alnahas Alhomse** — Flutter Developer & Informatics Engineer.

Live at: **https://engmoaznh-eng.github.io/portfolio/**

## About

A single-page, responsive Flutter Web application showcasing real projects, skills, experience and education,
built entirely from the owner's CV. No invented companies, statistics, or testimonials — see
[`PROJECT_ANALYSIS.md`](PROJECT_ANALYSIS.md) for exactly what was sourced from where.

## Features

- Sticky, responsive navigation with smooth scroll-to-section
- Hero, About, Skills, Projects, Experience, Education and Contact sections
- Project grid with a full details view + screenshot gallery/lightbox
- CV download, mailto/tel contact links, GitHub/LinkedIn (shown once provided)
- Dark, gradient-accented design system — no external UI kit, fully centralized theme
- Mobile / tablet / desktop / wide breakpoints with purpose-built layouts (not naive scaling)
- Subtle scroll-reveal + hover animations, reduced-motion aware

## Tech Stack

- Flutter (stable, web target) / Dart
- Packages: `google_fonts`, `url_launcher`, `font_awesome_flutter`
- No backend — this is a fully static site. The contact "form" opens a pre-filled `mailto:` link.

## Project Structure

```
lib/
  core/        # theme, responsive breakpoints, constants, url launcher utility
  models/      # Project, Experience, Education, SkillCategory
  data/        # personal_data.dart, projects_data.dart, etc. — the ONLY place facts live
  sections/    # one folder per page section (home, about, skills, projects, ...)
  widgets/     # reusable navigation/buttons/cards/project/common widgets
assets/
  cv/cv.pdf
  images/projects/<project-id>/cover.png, screenshot-1.png, screenshot-2.png, ...
```

## Running Locally

```bash
flutter pub get
flutter run -d chrome
```

## Building for Production

```bash
flutter build web --release --base-href /portfolio/
```

Output is written to `build/web/`. The `--base-href /portfolio/` flag matters: this repo is deployed as a
GitHub Pages **project site** (`https://<user>.github.io/portfolio/`), not a user/root site, so every asset
path must be aware it's served from a subpath.

## Adding a New Project

1. Open [`lib/data/projects_data.dart`](lib/data/projects_data.dart) and add a new `Project(...)` entry — pick a
   short lowercase `id` (e.g. `my_new_app`), fill in `name`, `period`, `category`, `shortDescription`,
   `description`, and `technologies` (only technologies you actually used).
2. Create the folder `assets/images/projects/<id>/`.
3. Drop in `cover.png` and `screenshot-1.png`, `screenshot-2.png`, `screenshot-3.png` (or however many —
   adjust `screenshotCount` on the `Project` entry to match).
4. Add the folder path to the `assets:` list in [`pubspec.yaml`](pubspec.yaml).
5. Run `flutter pub get` and reload.

No section or widget file needs to change — the grid, cards, and details view all read from this one list.

## Adding / Replacing Project Images

- Location: `assets/images/projects/<project-id>/`
- Recommended: `cover.png` at **1600×1000px** (16:10), screenshots at the same ratio, PNG or JPG,
  optimized/compressed before adding (keep individual files under ~500KB for fast loading).
- Until a real image is added, the site automatically shows a clean "Image coming soon" placeholder card
  instead of a broken image — nothing looks unfinished.
- Current folders ready for your screenshots: `massar`, `warraq`, `quran`, `sign_language`, `maze_game`, `bmi`,
  `mrb_coin`, `shisha`, `playstation_cafe`, `tammini`.

## Replacing the CV

Replace `assets/cv/cv.pdf` with your updated file (keep the same filename), then rebuild. The "Download CV"
button always points at this path.

## Changing Personal Info / Social Links

All of it lives in [`lib/data/personal_data.dart`](lib/data/personal_data.dart):

- `githubUrl` / `linkedinUrl` are `String?` — currently `null` because the CV didn't list them. Set them to your
  real profile URLs and the GitHub/LinkedIn buttons will automatically appear in the nav bar, hero, and contact
  section (no other file needs editing).
- `email`, `phone`, `heroIntro`, `profileSummary`, `strengths` — edit directly.

Skills, experience, and education live in `lib/data/skills_data.dart`, `experience_data.dart`, and
`education_data.dart` respectively, following the same pattern.

## Deployment (GitHub Pages)

This repo includes [`.github/workflows/deploy.yml`](.github/workflows/deploy.yml), which on every push to
`main`:

1. Checks out the repo
2. Installs Flutter (stable)
3. Runs `flutter pub get`
4. Runs `flutter build web --release --base-href /portfolio/`
5. Uploads `build/web` as a Pages artifact and deploys it

**One-time manual step required by GitHub:** in the repo's **Settings → Pages**, set **Source** to
**"GitHub Actions"** (it defaults to "Deploy from a branch", which this workflow does not use).

Once enabled, every push to `main` redeploys automatically. The live URL will be:

```
https://engmoaznh-eng.github.io/portfolio/
```

## Quality Checks Run

```bash
flutter pub get       # OK
flutter analyze       # No issues found
flutter build web --release --base-href /portfolio/   # Build succeeded
```

See [`CURRENT_STATUS.md`](CURRENT_STATUS.md) for the full verification log and what's still outstanding.
