# Project Analysis

## 1. Repository State (at project start)

- Location: `C:\mywork\portfolio` — did not exist prior to this task. No GitHub repo existed yet.
- No prior Flutter project, no existing assets, no prior portfolio content of any kind.
- Scaffolded fresh with `flutter create --platforms=web --project-name portfolio --org com.moazalnahas portfolio` (Flutter 3.27.4 / Dart 3.6.2, stable channel).
- Sibling directories on this machine (`C:\mywork\flutter-project\{massar,warraq,quran,tammenni-app,mrb-app-v2,trix}`) confirm several of the CV's listed projects are real, existing Flutter apps — used only to corroborate the CV, not as a source of new facts.

## 2. CV Source

Source file: `C:\Users\moaz\Downloads\Moaz Alnahas Alhumsi.pdf` (as provided by the user), copied into the project at `assets/cv/cv.pdf` for the public "Download CV" button.

### Extracted facts (verbatim/paraphrased, nothing added)

**Identity**
- Name: Moaz Alnahas Alhumsi
- Title on CV: "Informatic Engineer" (spelling corrected to "Informatics Engineer" in the UI — not a factual change)
- Phone: +963 981 174 823
- Email: eng.moaznh@gmail.com

**Not present in the CV** (left blank/hidden in the UI, not invented): GitHub URL, LinkedIn URL, physical address, years-of-experience figure, company names for the "Flutter Frontend End" role, any client names, any metrics/statistics.

**Profile Summary** (used near-verbatim for the About section)
> Informatics Engineering graduate with a strong background in software development, especially using the Flutter framework. Experience in cross-platform application development, implementing software projects that rely on databases and web design, skilled in creating innovative solutions — demonstrated through projects like a Maze Game Algorithm and an Age/Sign-language detection system. Currently building and marketing a personal brand, and interested in modern technologies such as sign language recognition.

**Soft Skills**: Leadership, Problem Solving, Creative Thinking, Quality and Accuracy, Communication Skills

**Technical Skills**
- Flutter / Dart
- State Management: BLoC, GetX
- Version Control: Git, GitHub, GitLab
- API Tools: Postman
- UI/UX Tools: Figma
- Backend Communication: REST APIs, GraphQL

**Experience / Activity entries**
1. Flutter Frontend Development — 2023 — cross-platform app development using BLoC & GetX state management (no company named on the CV)
2. Personal Brand Creation & Marketing — 2022–2023 — founded and manages a personal brand's marketing strategy, digital campaigns and content creation
3. Courses & Certifications — 2023 — PHP, SQL, Web Design, C#, Flutter

**Education**
1. Bachelor of Information Technology — "Information Technology for Science & Technology, Daraa" — 2018–2024 — Software Engineering, Networks and Artificial Intelligence
2. Primary, Preparatory & Secondary stages — 2005–2017 — High School Graduate

**Projects (10, all real, from CV page 2)**
1. Massar — Sep 2025–Present
2. Warraq — Aug 2025–Present
3. Holy Quran — Oct 2025
4. American Sign Language — Jul 2024
5. Maze Game Algorithm — Feb 2023
6. BMI App — Jun 2023
7. MRB Coin App — Feb 2025
8. Shisha App — Mar 2025
9. PlayStation Café App — Jul 2025
10. Tammini App — Jan 2025

Full descriptions and tech tags for each are only included where the CV explicitly states them — see `PROJECT_SPECIFICATION.md` §6 and `lib/data/projects_data.dart` for the exact per-project breakdown.

### Explicitly NOT included
- **"Historic Syria"** — named in the task brief as an expected project, but it does not appear anywhere in the CV. No description, tech stack, or dates exist for it. Rather than invent this content, it has been **omitted** from the live site. The data structure makes it trivial to add later (see README "Adding a New Project"), once the user supplies real details and images.
- Any percentage-based skill bars (e.g. "Flutter 95%") — CV gives no percentages, so none are shown.
- Any client testimonials, pricing, blog, or services sections — not requested by the CV and explicitly excluded by the brief.

## 3. Decisions made during intake (confirmed with user)

- GitHub account: `engmoaznh-eng` → Pages URL will be `https://engmoaznh-eng.github.io/portfolio/`.
- New repo will be created locally at `C:\mywork\portfolio` first; the user will create the empty GitHub repo (`portfolio`) and push, or ask this assistant to push once the remote exists — no destructive/publishing git action is taken without explicit confirmation.
