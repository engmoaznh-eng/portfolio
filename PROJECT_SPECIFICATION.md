# Project Specification

## 1. Goal

A production-ready, single-page Flutter Web portfolio for Moaz Alnahas Alhumsi, deployed to GitHub Pages at
`https://engmoaznh-eng.github.io/portfolio/`, used to apply for Flutter/software jobs and to be sent directly to
recruiters, agencies, and clients. Premium, modern, **dark** developer aesthetic — not a template, not
AI-effect-heavy, not colorful/gaming-styled.

## 2. Tech stack

- Flutter (stable 3.27.x) / Dart, Web target only.
- No routing package needed — single scrollable page with anchor sections + a `url_launcher`-driven CV/social
  links. A project "details" view opens as a full-screen dialog/route (still within one Flutter app, no external
  page).
- Packages: `url_launcher` (mailto, tel, GitHub/LinkedIn, CV download), `google_fonts` (self-hosted-safe fallback
  to bundled fonts to avoid runtime Google Fonts fetch — pinned via `google_fonts` with `GoogleFonts.config
  .allowRuntimeFetching = false` and bundled font assets), `flutter_svg` (optional icons). Kept minimal — no state
  management package needed since the site is stateless/presentational (local `ValueNotifier`/`StatefulWidget`
  suffices for the mobile nav drawer and lightbox).

## 3. Architecture

```
lib/
  main.dart                     # App entry, theme wiring, single HomePage scaffold
  core/
    constants/
      app_strings.dart          # Non-personal static copy (section titles, button labels)
      app_dimensions.dart       # Spacing, radius, breakpoints, max content width
    theme/
      app_colors.dart           # Centralized color palette (dark theme, accents)
      app_text_styles.dart      # Centralized typography scale
      app_theme.dart            # ThemeData assembly
    responsive/
      responsive.dart           # Breakpoint enum + LayoutBuilder-based Responsive widget/helpers
    utils/
      url_launcher_util.dart    # Safe wrappers around url_launcher (mailto/tel/http/asset download)
  models/
    project_model.dart
    experience_model.dart
    education_model.dart
    skill_category_model.dart
  data/
    personal_data.dart          # Name, title, contact, social links (nullable if unknown), summary
    skills_data.dart
    projects_data.dart          # The 10 real projects
    experience_data.dart
    education_data.dart
  sections/
    home/home_section.dart              # Hero
    about/about_section.dart
    skills/skills_section.dart
    projects/projects_section.dart
    projects/project_details_view.dart  # Full-screen details + gallery
    experience/experience_section.dart
    education/education_section.dart
    contact/contact_section.dart
  widgets/
    navigation/nav_bar.dart
    navigation/mobile_nav_drawer.dart
    buttons/primary_button.dart
    buttons/secondary_button.dart
    buttons/social_icon_button.dart
    cards/section_container.dart        # Shared max-width/padding wrapper per section
    cards/glass_card.dart
    project/project_card.dart
    project/tech_badge.dart
    project/screenshot_gallery.dart
    common/section_heading.dart
    common/animated_fade_in.dart        # Reveal-on-scroll wrapper (respects reduced motion)
```

Rule of thumb: **widgets are dumb and reusable, sections compose widgets + data, data files are the only place
project/personal facts live.** Adding a project never requires touching a section or widget file.

## 4. Data model (adding a project = edit one file + add images)

```dart
class Project {
  final String id;              // folder name under assets/images/projects/<id>/
  final String name;
  final String shortDescription; // for the card
  final String description;      // for the details view
  final List<String> technologies; // only ones explicitly known — empty list is fine, UI hides the row
  final String coverImage;         // assets/images/projects/<id>/cover.png
  final List<String> screenshots;  // assets/images/projects/<id>/screenshot-N.png
  final String? githubUrl;         // null => GitHub button hidden
  final String? liveUrl;           // null => Live Demo button hidden
  final String category;           // "Mobile App" | "AI" | "Algorithm"
  final String period;             // e.g. "Sep 2025 – Present"
}
```

`Experience`, `Education`, `SkillCategory` are similarly flat, CV-sourced-only models.

## 5. Sections & content (in scroll order)

1. **Home / Hero** — Name, title ("Flutter Developer & Informatics Engineer"), 1–2 line intro derived from the CV
   summary, `View My Projects` + `Download CV` buttons, social icons (Email always shown; GitHub/LinkedIn shown
   only once the user supplies URLs — see §9), abstract dev-themed visual (no stock photo).
2. **About** — Full profile summary (left) + strength chips derived only from CV soft skills (right): Leadership,
   Problem Solving, Creative Thinking, Quality & Accuracy, Communication.
3. **Skills** — Grouped: Mobile Development (Flutter/Dart, BLoC, GetX), Tools (Git/GitHub/GitLab, Postman,
   Figma), APIs (REST, GraphQL), Other (PHP, SQL, C#, Web Design — from the "Courses & Certifications" line). No
   percentage bars.
4. **Projects** — Grid of 10 cards (see §6), each opens a details view with gallery.
5. **Experience** — Timeline: Flutter Frontend Development (2023), Personal Brand Creation & Marketing
   (2022–2023). "Courses & Certifications" rendered as a small badge list rather than a fake job title, since the
   CV itself separates it from work experience.
6. **Education** — Bachelor of Information Technology (2018–2024), Secondary education (2005–2017).
7. **Contact** — Email (mailto), phone (tel), GitHub/LinkedIn (hidden until provided), and a `mailto:`-based
   contact form (no fake "message sent" backend — this is a static site).

## 6. Projects to render

| id | Name | Period | Category |
|---|---|---|---|
| massar | Massar | Sep 2025 – Present | Mobile App |
| warraq | Warraq | Aug 2025 – Present | Mobile App |
| quran | Holy Quran | Oct 2025 | Mobile App |
| sign_language | American Sign Language | Jul 2024 | AI |
| maze_game | Maze Game Algorithm | Feb 2023 | Algorithm |
| bmi | BMI App | Jun 2023 | Mobile App |
| mrb_coin | MRB Coin App | Feb 2025 | Mobile App |
| shisha | Shisha App | Mar 2025 | Mobile App |
| playstation_cafe | PlayStation Café App | Jul 2025 | Mobile App |
| tammini | Tammini App | Jan 2025 | Mobile App |

"Historic Syria" is intentionally excluded — see `PROJECT_ANALYSIS.md` §2.

## 7. Design system

- **Background**: near-black (`#0A0E14` base, `#0F1420` surface) — not pure `#000000`.
- **Accents**: blue→purple gradient (`#5B8DEF` → `#8B5CF6`), used sparingly for CTAs, headings underline,
  active nav state, glow/border accents.
- **Text**: high-contrast off-white primary (`#E7E9EE`), muted grey secondary (`#9AA3B2`) — both pass WCAG AA on
  the surface colors.
- **Cards**: subtle 1px border (`#1F2633`), soft shadow, faint glassmorphism (low-opacity blur) only on hero/nav,
  not overused elsewhere.
- **Typography**: one display font for headings (geometric sans, e.g. `Sora`/`Space Grotesk` via `google_fonts`
  bundled), one body font (`Inter`). Centralized in `app_text_styles.dart`.
- **Motion**: fade+slight-slide reveal on scroll (`AnimatedFadeIn`), hover elevation/scale on cards and buttons
  (desktop only), all durations 150–400ms, `MediaQuery.disableAnimations` respected.

## 8. Responsive strategy

Breakpoints (`core/responsive/responsive.dart`): mobile `<600`, tablet `600–1024`, desktop `>1024`, wide
`>1440`. Each section uses `LayoutBuilder`/`Responsive` to pick a **purpose-built** layout per tier (not a naive
scale-down):
- Nav: full horizontal menu ≥1024px; hamburger + drawer below.
- Hero: two-column (text + visual) ≥1024px; stacked, centered below.
- About: two-column ≥900px; stacked below.
- Skills/Projects: `GridView`/`Wrap` with column count 1 (mobile) / 2 (tablet) / 3 (desktop) / 4 (wide, projects
  only if ≥1440).
- Experience/Education: vertical timeline at all sizes, connector line hidden on mobile for cleanliness.

## 9. Handling missing information (no fake placeholders)

- GitHub URL, LinkedIn URL: `personal_data.dart` has them typed as `String?`. While `null`, the corresponding nav
  bar / hero / contact buttons are simply not built (not shown greyed-out, not shown as "ADD LINK").
  `PersonalData` includes an inline comment marking exactly where to paste the real URL later — documented in
  README "Changing Social Links".
- Project screenshots: `assets/images/projects/<id>/` ships with only a generated placeholder `cover.png`
  containing the project name and "Add screenshot" hint text (a real PNG asset, not a broken path), so the site
  never shows a broken-image icon. The moment the user drops in a real `cover.png`/`screenshot-N.png` with the
  same filename, it replaces the placeholder — no code change needed.

## 10. GitHub Pages deployment

- Repo name: `portfolio` → base href must be `/portfolio/`.
- `flutter build web --release --base-href /portfolio/` is what the CI workflow runs (this is why source is not
  built with the default `/`).
- `.github/workflows/deploy.yml`: triggers on push to the repo's default branch, sets up Flutter (stable), `flutter
  pub get`, `flutter build web --release --base-href /portfolio/`, uploads `build/web` as a Pages artifact, deploys
  via `actions/deploy-pages`. Repo Settings → Pages → Source must be set to "GitHub Actions" (documented in
  README, one-time manual step GitHub requires).

## 11. Explicitly out of scope

No blog, pricing, services, testimonials, client logos, or fabricated statistics — per the task brief §36.
